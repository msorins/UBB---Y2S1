; Se da o lista liniara, sa se adune 1 la toate numerele pare (la toate nivelele)

; Varianta MAPCAR
(DEFUN RplaceA(L)
  (COND
    ( (NULL L) NIL )
    ( (AND (NUMBERP L) (EQUAL (MOD L 2) 0)) (+ L 1) )
    ( (ATOM L) L )
    ( (LISTP L) (MAPCAR 'RplaceA L) )
  )
)

; Varianta fara MAPCAR
(DEFUN RplaceB(L)
  (COND
    ( (NULL L) NIL )
    ( (AND (NUMBERP (CAR L)) (EQUAL (MOD (CAR L) 2) 0)) (CONS (+ (CAR L) 1) (RplaceB (CDR L))) )
    ( (ATOM (CAR L)) (CONS (CAR L) (RplaceB (CDR L))) )
    ( (LISTP (CAR L)) (CONS (RplaceB (CAR L)) (RplaceB (CDR L))) )
  )
)


(SETQ L (LIST 1 2 3 4 5 6 (LIST 1 2  48 391 132 599 (LIST (LIST (LIST 2)))(LIST 10 11 12) 3)))
(WRITE (RplaceA L))
(WRITE (RplaceB L))
