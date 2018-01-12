; Write a function that returns the number of atoms in a list, at any level.

(DEFUN CountNumbers(l)
  (COND
    ( (NULL l) 0 )
    ( (NUMBERP l) 1)
    ( (ATOM l) 0)
    ( (LISTP l) (APPLY '+ (MAPCAR 'CountNumbers l)) )
  )
)

(SETQ l (LIST 1 2 (LIST 5 (LIST 7 8 9 10) 6 ) 3 4))
(WRITE (CountNumbers l))
