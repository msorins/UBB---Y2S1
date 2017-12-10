; Write a function to insert an element E on the n-th position of a linear list.
(defun insertn(l e n crt)
  (COND
    ((NULL l) NIL)
    ((eq crt n) (CONS e (CONS (CAR l) (insertn (CDR l) e n (+ crt 1) ) ) ) )
    ((not (eq crt n)) (CONS (CAR l) (insertn (CDR l) e n (+ crt 1) ) ) )
  )
)

; Write a function to return the sum of all numerical atoms of a list, at any level
(DEFUN sum(l)
  (COND
    ((NULL l) 0)
    ((NOT (LISTP (CAR l))) (+ (CAR l) (sum (CDR l))))
    ((LISTP (CAR l)) (+ (sum(CAR l)) (sum(CDR l))))
  )

)

; Write a function to return the set of all sublists of a given linear list
(DEFUN subl(l)
  (COND
    ((NULL l) NIL)
    ((LISTP (CAR l))  (CONS (CONS (CAR l) (subl (CAR l))) (subl (CDR l))))
    ((NOT(LISTP (CAR l)))  (subl (CDR l)))
  )
)

; Write a function to test the equality of two sets, without using the difference of two sets

(DEFUN isin(lst elem)
  (COND
    ((NULL lst) 0)
    ((= (CAR lst) elem) 1)
    ((TRUE) (isin (CDR lst) elem))
  )
)

(DEFUN myadjoin(elem lst)
  (COND
    ((= (isin lst elem) 1) lst)
    ((= (isin lst elem) 0) (CONS elem lst))
   )
)

(DEFUN solve(a b)
  (COND
    ((NULL b) 1)
    ((= (solve a (CDR b)) 0) 0)
    ((= (LENGTH a) (LENGTH (myadjoin (CAR b) a))) 1)
    (T 0)
  )
)


(defun testA()
  (setq x (list 1 2 3 4 5 6))
  (assert (equal (insertn x 99 3 1) (list 1 2 99 3 4 5 6) ))
  (assert (equal (insertn x 99 1 1) (list 99 1 2 3 4 5 6) ))
  (assert (equal (insertn x 99 4 1) (list 1 2 3 99 4 5 6) ))
)

(defun testB()
  (setq x (list 1 2 3 3))
  (assert (equal (sum x) 9 ))

  (setq y (list 0))
  (assert (equal (sum y) 0 ))

  (setq z (list 1 2 (list 1 2)))
  (assert (equal (sum z) 6 ))

  (setq w (list 1 2 (list 1 2 (list 1 2))))
  (assert (equal (sum w) 9 ))
)

(defun testC()
  (setq x '(1 2 3))
  (assert (equal (subl x) NIL ))

  (setq y (list (list 1) (list 2)))
  (write (subl y))
  (assert (equal (subl y) (list (list (list 1)) (list (list 2))) ))
)

(defun testD()
  (setq x (list 1 2 3))
  (setq y (list 1 2 3))
  (assert (equal (solve x y) 1 ))

  (setq a (list ))
  (setq b (list ))
  (assert (equal (solve a b) 1 ))

  (setq c (list 1 2 3 4 9 ))
  (setq d (list 1 2 3 4 5))
  (assert (equal (solve c d) 0 ))

  (setq e (list 9 4 3 ))
  (setq f (list 9 6 4 3))
  (assert (equal (solve e f) 0  ))
)


(defun tests ()
  (testA)
  (testB)
  (testC)
  (testD)
)

(tests)
