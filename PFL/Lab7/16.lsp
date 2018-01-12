; Write a function that produces the linear list of all atoms of a given list, from all levels, and written in
; the same order. Eg.: (((A B) C) (D E)) --> (A B C D E)
(DEFUN linearize (lst)
  (COND
    ( (NULL lst) NIL )
    ( (ATOM lst) (LIST lst) )
    ( (LISTP lst)
      (PROGN
        (setq res (list ))
        (MAPCAR (lambda (a) (setq res (APPEND res (linearize a)))) lst)
        res
      )
    )
  )
)

(SETQ l (LIST 1 2 3 (LIST 4 5 6 (LIST 7 8 9)) 10 11 12))
(SETQ l2 (LIST 1 2 (LIST 3 4) 5))
(WRITE (linearize l))
