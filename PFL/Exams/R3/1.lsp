(DEFUN F(L)
  (COND
    ( (ATOM L) -1 )
    ( (> (F (CAR L)) 0) (WRITE "OK") )
    ( T (F(CDR L)) )
  )
)

; daca e atom returneaza -1
; (LIST 1 2 (LIST 3 4 5 ) LIST 6)
; + 1

(SETQ l (LIST (LIST 4 5 6) 3 4 (LIST 7 8 9) 5))
(WRITE (F l))
