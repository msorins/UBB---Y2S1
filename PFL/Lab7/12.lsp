; Write a function that substitutes an element through another one at all levels of a given list.
(DEFUN SubstituteElem(lst old new)
  (COND
    ( (NULL lst) NIL )
    ( (AND (ATOM lst) (EQUAL lst old)) new )
    ( (ATOM lst) lst )
    ( (LISTP lst) (MAPCAR (lambda (a) (SubstituteElem a old new)) lst) )
  )
)

(SETQ l (LIST 1 2 3 (LIST 8 9 4 4 4 (LIST 4)) 4 5 3 2 4))
(WRITE (SubstituteElem l 4 99) )
