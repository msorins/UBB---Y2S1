;Nr de subliste pentru care primul atom numeric este impar

(DEFUN FirstNumericOdd(L)
  (COND
    ( (NULL L) 0 )
    ( (AND (NUMBERP (CAR L)) (EQUAL (MOD (CAR L) 2) 1)) 1)
    ( (NUMBERP (CAR L))  0 )
    ( T (FirstNumericOdd (CDR L)) )
  )
)

(DEFUN CountLists(L)
  (COND
    ( (NULL L) 0 )
    ( (ATOM L) 0 )
    ( (LISTP L) (+ (FirstNumericOdd L) (APPLY '+ (MAPCAR 'CountLists L))) )
  )
)

(SETQ l (LIST 'a 2 (LIST 'a 'b (LIST 1) 'd 3)))
(WRITE (CountLists l))
