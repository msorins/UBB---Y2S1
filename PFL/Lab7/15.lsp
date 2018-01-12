; Write a function that reverses a list together with all its sublists elements, at any level
(DEFUN RevList (lst)
  (COND
    ( (NULL lst) (LIST ) )
    ( (EQUAL (LIST-LENGTH lst) 1) lst)
    ( T (APPEND (RevList (CDR lst)) (LIST (CAR lst)) ))
  )
)

(DEFUN RevAllLists (lst)
  (COND
    ( (NULL lst) NIL )
    ( (NUMBERP lst) lst )
    ( (LISTP lst) (MAPCAR 'RevAllLists (RevList lst)) )
  )
)

(SETQ l (LIST 1 (LIST 10 11 12 13 14 15 (LIST 1 2 3)) 2 3 4 5 6))
(WRITE (RevAllLists l))
