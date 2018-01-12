; Write a function that removes all occurrences of an atom from any level of a list.

(DEFUN remx (l x)
  (COND
    ( (NULL l) NIL )
    ( (AND (ATOM (CAR l)) (NOT (EQUAL (CAR l) x))) (CONS (CAR l) (remx (CDR l) x)) )
    ( (AND (ATOM (CAR l)) (EQUAL (CAR l) x)) (remx (CDR l) x) )
    ( (LISTP (CAR l)) (CONS (remx (CAR l) x) (remx (CDR l) x)) )
  )
)

(SETQ l (LIST 1 2 (LIST 1 2 3 4 ) 3 4 5 6 7 8 9 10))
(WRITE (remx l 2))
