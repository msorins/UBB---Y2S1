;Un arbore binar se memoreaza (radacina (lista-subarbore-1) (lista-subarbore-2)). Sa se afiseze calea de la radacina pana la un nod x dat
;Teste:
;(A (B) (C)) A -> (A)
;(A (B (C) (D)) (E)) D -> (A B D)
;(A (B (C) (D)) (E (F) (G (H)(I)))) I -> (A E G I)
;(A (B) (C (D)(E))) E -> (A C E)

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



(DEFUN Tests()

    ; TEST 1
    (SETQ L (LIST 'a (LIST 'b) (LIST 'c)))
    (SETQ ResGlobal (LIST))
    (FindPath L 'A)
    (EQUAL ResGlobal (LIST 'a))

    ; TEST 2
    (SETQ L (LIST 'a (LIST 'b (LIST 'c) (LIST 'd)) (LIST 'e)))
    (SETQ ResGlobal (LIST))
    (FindPath L 'D)
    (EQUAL ResGlobal (LIST 'a 'b 'd))


    ; (A (B (C) (D)) (E (F) (G (H)(I)))) I -> (A E G I)
    ; TEST 3
    (SETQ L  (LIST 'a (LIST 'b (LIST 'c) (LIST 'd)) (LIST 'e (LIST 'f) (LIST 'g (LIST 'h) (LIST 'i))) ) )
    (SETQ ResGlobal (LIST))
    (FindPath L 'I)
    (EQUAL ResGlobal (LIST 'a 'e 'g 'i))


    ; (A (B) (C (D)(E)))
    ; TEST 4
    (SETQ L  (LIST 'a (LIST 'b) (LIST 'c (LIST 'd) (LIST 'e))) )
    (SETQ ResGlobal (LIST))
    (FindPath L 'E)
    (EQUAL ResGlobal (LIST 'a 'c 'e))
)

(WRITE (Tests ))
