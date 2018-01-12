;. Define a function that returns the depth of a tree represented as (root list_of_nodes_subtree1 ...
; list_of_nodes_subtreen)
; Eg. the depth of the tree (a (b (c)) (d) (e (f))) is 3

(DEFUN DepthOfTree(lst depth)
  (COND
    ( (NULL lst) depth )
    ( (ATOM lst) depth )
    ( (LISTP lst) (APPLY 'max (MAPCAR (lambda(a) (DepthOfTree a (+ depth 1)) ) lst) ) )
  )
)

(SETQ l (LIST 1 (LIST 2 (LIST 3)) (LIST 4) (LIST 5 (LIST 6))) )
(WRITE (DepthOfTree l 0))
