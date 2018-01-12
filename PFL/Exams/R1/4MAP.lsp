; Se da un arbore n-ar .. sa se inlocuiasca nodurile din nivelul X cu o valoare E

(DEFUN rplace(lst lvl clvl e)
  (COND
    ( (NULL lst) NIL)
    ( (AND (ATOM lst) (EQUAL lvl clvl)) e)
    ( (ATOM lst) lst )
    ( (LISTP lst) (MAPCAR (lambda(a) (rplace a lvl (+ clvl 1) e)) lst) )
  )
)

(DEFUN main(lst lvl e)
  (rplace lst lvl -1 e)
)

(SETQ l (LIST 1 (LIST 2 (LIST 3)) (LIST 4) (LIST 5 (LIST 6))) )
(WRITE (main l 0 99))
