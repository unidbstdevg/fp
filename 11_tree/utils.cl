(defun get-val (tree)
  (car tree))

(defun get-left (tree)
  (cadr tree))

(defun get-right (tree)
  (caddr tree))

(defun make-tree (val left right)
  (list val left right))

; actually BST
(defun add-val-tree (val tree)
  (cond ((null tree) (make-tree val '() '()))
        ((> val (get-val tree)) (make-tree (get-val tree)
                                           (get-left tree)
                                           (add-val-tree val (get-right tree))))
        ((< val (get-val tree)) (make-tree (get-val tree)
                                           (add-val-tree val (get-left tree))
                                           (get-right tree)))
        ((= val (get-val tree)) tree)))
