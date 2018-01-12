; Se da o lista neliniara
; Sa se numere toate sublistele care sunt la nivel impar pentru care atomul numeric minim este impar

(DEFUN Minim(Lst Parity)
  (COND
    ( (NULL Lst) 9999999 )
    ( (AND (NUMBERP (CAR Lst)) (EQUAL (MOD (CAR Lst) 2) Parity)) (MIN (CAR Lst) (Minim (CDR Lst) Parity)) )
    ( T (Minim (CDR Lst) Parity))
  )
)

(DEFUN IsMinimumEven(Lst)
  (IF (< (Minim Lst 0) (Minim Lst 1))
    1
    0
  )
)

(DEFUN CountSubLists(Lst CrtLvl)
  (WRITE Lst)
  (Write " ")
  (WRITE CrtLvl)
  (WRITE-LINE "")
  (COND
    ( (NULL Lst) 0 )
    ( (ATOM Lst) 0 )
    ( (AND (LISTP Lst) (EQUAL (MOD (+ CrtLvl 1) 2) 1) (EQUAL (IsMinimumEven Lst) 1))  (+ 1 (APPLY '+ (MAPCAR (lambda(a) (CountSubLists a (+ 1 CrtLvl))) Lst))) )
    ( (LISTP Lst)  (+ 0 (APPLY '+ (MAPCAR (lambda(a) (CountSubLists a (+ 1 CrtLvl))) Lst))) )
  )
)


(SETQ l (LIST 3 (LIST 2 3 4) 4 5 6))
(WRITE (CountSubLists l 1))
