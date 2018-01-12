; Write a function that computes the sum of even numbers and the decrease the sum of odd numbers,
; at any level of a list.
(DEFUN SumEO(lst)
  (COND
    ( (NULL lst) 0 )
    ( (AND (NUMBERP lst) (EQUAL (MOD lst 2) 0)) lst )
    ( (AND (NUMBERP lst) (EQUAL (MOD lst 2) 1)) (* lst -1) )
    ( (LISTP lst) (APPLY '+ (MAPCAR 'SumEO lst)) )
  )
)

(SETQ l (LIST 1 2 3 4 5 6))
(WRITE (SumEO l) )
