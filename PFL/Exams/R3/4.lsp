; Atomii de pe nivelul K sa se inlocuiasca ca 0

(DEFUN Rplace(Lst K CrtK)
  (COND
    ( (NULL Lst) NIL)
    ( (AND (ATOM Lst) (EQUAL K CrtK)) 0 )
    ( (ATOM Lst) Lst)
    ( (LISTP Lst) (MAPCAR (lambda(a) (Rplace a k (+ CrtK 1))) Lst) )
  )
)

(SETQ l (LIST 'a (LIST 1 (LIST 2 'b)) (LIST 'c (LIST 'd))))
(WRITE l)
(WRITE (Rplace l 3 0))
