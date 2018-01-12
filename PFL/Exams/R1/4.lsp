; Se da un arbore n-ar .. sa se inlocuiasca nodurile din nivelul X cu o valoare E
(DEFUN rplace(lst lvl clvl e)
  (COND
    ( (NULL lst) NIL )
    ( (AND (ATOM (CAR lst)) (EQUAL lvl clvl)) (CONS e (rplace (CDR lst) lvl clvl e)) )
    ( (ATOM (CAR lst)) (CONS (CAR lst) (rplace (CDR lst) lvl clvl e)) )
    ( (LISTP (CAR lst)) (CONS (rplace (CAR lst) lvl (+ clvl 1) e) (rplace (CDR lst) lvl clvl e)) )
  )
)

(DEFUN main(lst lvl e)
  (rplace lst lvl -1 e)
)

(SETQ l (LIST 1 (LIST 2 (LIST 3)) (LIST 4) (LIST 5 (LIST 6))) )
(WRITE (main l 1 99))
