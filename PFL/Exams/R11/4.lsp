

(DEFUN FindPath(L E)
  (COND
    ( (NULL L) 0 )
    ( (AND (ATOM L) (EQUAL L E)) 1 )
    ( (ATOM L) 0 )
    ( (LISTP L)
        (PROGN
          (SETQ Res (APPLY '+ (MAPCAR (lambda(a) (FindPath a E)) L)))
          (IF (EQUAL Res 1)
            (SETQ ResGlobal (APPEND (LIST (CAR L)) ResGlobal))
          )
        )
        Res
    )
  )
)

(SETQ l (LIST 'a (LIST 'b (LIST 'g)) (LIST 'c (LIST 'd (LIST 'e)) (LIST 'f))))
(SETQ ResGlobal (LIST ))
(FindPath l 'e)
(WRITE ResGlobal)
