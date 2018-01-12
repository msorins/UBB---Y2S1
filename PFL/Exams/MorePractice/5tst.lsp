(defun f()
  (print "ok")
)

(setf g 'f)
(funcall g)
