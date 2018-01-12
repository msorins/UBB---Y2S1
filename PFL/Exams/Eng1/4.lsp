
(DEFUN RM(L E)
  (COND
    ( (NULL L) (LIST  ) )
    ( (AND (ATOM (CAR L)) (EQUAL (CAR L) E)) (RM (CDR L) E) )
    ( T (CONS (CAR L) (RM (CDR L) E)) )
  )
)

(DEFUN Trans(L E)
  (COND
    ( (NULL L)  (LIST ) )
    ( (ATOM L) L )
    ( (LISTP L) (MAPCAR (lambda(a) (Trans a E)) (RM L E)) )
  )
)

; ###################################################

(DEFUN RMB(L E)
  (COND
    ( (NULL L) (LIST  ) )
    ( (AND (ATOM (CAR L)) (EQUAL (CAR L) E)) (RMB (CDR L) E) )
    ( (ATOM (CAR L)) (CONS (CAR L) (RMB (CDR L) E)) )
    ( (LIST (CAR L)) (CONS (RMB (CAR L) E) (RMB (CDR L) E)) )
  )
)


(SETQ L (LIST 1 2 3 (LIST 4 4 3 3 4 4 (LIST 3 5)) 4 5))
(WRITE L)
(WRITE (RMB L 3))
