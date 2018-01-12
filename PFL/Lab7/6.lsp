; Write a function that returns the maximum of numeric atoms in a list, at any level

(DEFUN MaxElem(l)
    (COND
      ( (NULL l) 0 )
      ( (NUMBERP l) l )
      ( (LISTP l) (APPLY 'max (MAPCAR 'MaxElem l)) )
    )
)

(SETQ l (LIST  1 2 3 (LIST 4 1 9 ) 4 2 1 2 3))
(WRITE (MaxElem l))
