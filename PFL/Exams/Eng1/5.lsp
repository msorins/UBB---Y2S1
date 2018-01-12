(DEFUN LastAtom(L)
  (COND
    ( (NULL L) NIL )
    ( (EQUAL (LIST-LENGTH L) 1) (CAR L) )
    ( T (LastAtom (CDR L)) )
  )
)

(DEFUN IsLastAtom(L)
  (IF (NULL (LastAtom L))
    0
    (IF (NOT (NUMBERP (LastAtom L)))
      1
      0
    )
   )
)

(DEFUN NRSL(L)
  (COND
    ( (NULL L) 0 )
    ( (ATOM L) 0 )
    ( (LISTP L) (+ (IsLastAtom L) (APPLY '+ (MAPCAR 'NRSL L))) )
  )
)

(SETQ L (LIST 1 2 (LIST 1 2 3  (LIST 1)) 3 4))
(WRITE (NRSL L))
