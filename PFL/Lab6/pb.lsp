(DEFUN inOrder(lst)
  (WRITE lst)
  (WRITE "      |      ")
  (COND
    ((= (list-length lst) 1) lst)
    ((= (list-length lst) 2) (APPEND (inOrder (CAR (CDR lst))) (CAR lst)) )
    ((= (list-length lst) 3) (APPEND (inOrder (CAR (CDR lst))) (LIST (CAR lst)) (inOrder (CAR (CDR (CDR lst))))  ) )
  )
)

(SETQ l (LIST `A (LIST `B) (LIST `C (LIST `D) (LIST `E))) )
(WRITE (inOrder l))
