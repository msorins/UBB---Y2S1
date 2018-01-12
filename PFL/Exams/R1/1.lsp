;
(DEFUN F(L)
  (MAX (CAR L) (CADDR L))
)

(SETQ F 10)
(SETQ G `F)
(WRITE (G `(8 11 2 3 7 9)))
