; Lista Neliniara
; Sa se determine nr de subliste de orice nivelele la care
; Atomul numeric maxim de pe nivelurile impare este par

(DEFUN Maximum(lst parity)
  (COND
    ( (NULL lst) 0 )
    ( (AND (NUMBERP (CAR lst)) (EQUAL (MOD (CAR lst) 2) parity)) (MAX (CAR lst) (Maximum (CDR lst) parity) ) )
    ( T (Maximum (CDR lst) parity) )
  )
)

(DEFUN IsEvenMaximum(lst)
  (IF (> (Maximum lst 0) (Maximum lst 1))
    1
    0
  )
)

(DEFUN Solve(Lst Lvl)
  (COND
    ( (NULL Lst) 0 )
    ( (ATOM Lst) 0 )
    ( (AND (EQUAL (MOD Lvl 2) 0) (LISTP Lst)) (APPLY '+ (MAPCAR (lambda(a) (Solve a (+ Lvl 1))) Lst)) )
    ( (AND (EQUAL (MOD Lvl 2) 1) (LISTP Lst) (EQUAL (IsEvenMaximum Lst) 1)) (+ 1 (APPLY '+ (MAPCAR (lambda(a) (Solve a (+ Lvl 1))) Lst))) )
    ( (AND (EQUAL (MOD Lvl 2) 1) (LISTP Lst) (EQUAL (IsEvenMaximum Lst) 0)) (+ 0 (APPLY '+ (MAPCAR (lambda(a) (Solve a (+ Lvl 1))) Lst))) )
  )
)

(DEFUN Main(Lst)
  (Solve Lst 2)
)

(SETQ L (LIST 1 7 (LIST 1 4 (LIST(LIST 1 88 777)) 3) 2 8))
(WRITE (Main L))
