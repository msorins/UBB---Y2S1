; Se da o lista liniara
; Prg pentru determinarea numarului de subliste de orice nivel pt care
; primul atom numeric la orice nivel este numar par

(DEFUN Linearize(lst)
  (COND
    ( (NULL lst) NIL )
    ( (ATOM (CAR lst)) (APPEND (LIST (CAR lst)) (Linearize (CDR lst))) )
    ( (LISTP (CAR lst)) (APPEND (Linearize (CAR lst)) (Linearize (CDR lst))) )
  )
)

(SETQ LL (LIST 1 2 3 (LIST 4 (LIST 5 6) 7 8)))
(WRITE (Linearize LL))

(DEFUN IsFirstEven(lst)
  (COND
    ( (NULL lst) 0 )
    ( (ATOM lst) 0 )
    ( (AND (LISTP lst) (NUMBERP (CAR lst)) (EQUAL (MOD (CAR lst) 2) 0)) 1 )
    ( (AND (LISTP lst) (NUMBERP (CAR lst)) (EQUAL (MOD (CAR lst) 2) 1)) 0 )
    ( (LISTP lst) (IsFirstEven (CDR lst)) )
    ( T 0 )
  )
)

(DEFUN CountSubLists(lst)
  (COND
    ( (NULL lst) 0 )
    ( (ATOM lst) 0 )
    ( (LISTP lst) (+ (IsFirstEven (Linearize lst)) (APPLY '+ (MAPCAR 'CountSubLists lst))) )
  )
)

(SETQ l (LIST `a `b 3 4 (LIST 3 4) `c))
(SETQ l2 (LIST `a (LIST 2 3 4)))
;(SETQ l2 (LIST (LIST `g 4) 6))
(WRITE (CountSubLists l2))
