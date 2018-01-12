; Write a function that returns the product of numeric atoms in a list, at any level

(DEFUN Product(l)
  (COND
    ( (NULL l) 1)
    ( (NUMBERP l) l)
    ( (LISTP l) (APPLY '* (MAPCAR 'Product l)) )
  )
)

(SETQ l (LIST 1 2 (LIST 2 3 (LIST 2)) 3 4))
(WRITE (Product l))
