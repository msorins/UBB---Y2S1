; Write a function to determine the depth of a list

(DEFUN DepthOfList(l level)
  (COND
    ((NULL l) level)
    ((NUMBERP l) level)
    ((LISTP l) (APPLY 'MAX (MAPCAR (lambda(lst) (DepthOfList lst (+ level 1))) l )) )
  )
)

(SETQ l (LIST 1 2 5 3 (LIST 1) 2 (LIST 2 (LIST 3 4 5)) 9 10 2 4))
(WRITE (DepthOfList l 0))
