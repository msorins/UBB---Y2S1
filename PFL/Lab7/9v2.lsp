; Write a function that removes all occurrences of an atom from any level of a list.

(defun remx (l x)
  (if (atom l)
      l
      (mapcar (lambda (subl) (remx subl x)) (remove-if #'(lambda (y) (EQUAL x y)) l))
  )
)

(SETQ l (LIST 1 2 (LIST 1 2 3 4 (LIST 1 2 2 2 2 3 4) ) 3 4 5 6 7 8 9 10))
(WRITE (remx l 2))

(DEFUN MAIN ()
  (EQUAL (remx (LIST 1 2 3 3 4 5 6) 3) (LIST 1 2 4 5 6) )
  (EQUAL (remx (LIST 1 4 5) 3) (LIST 1 4 5) )
  (EQUAL (remx (LIST 1 2 (LIST 1 2 3 4 (LIST 1 2 2 2 2 3 4) ) 3 4 5 6 7 8 9 10) 2) (LIST 1 (LIST 1 3 4 (LIST 1 3 4) ) 3 4 5 6 7 8 9 10) )
)

(WRITE (MAIN ))
