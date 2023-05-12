(load "utils.cl")

; Написать функцию (add-list-tree lst tree), которая добавляет в BST tree все
; элементы из списка lst.

(defun add-list-tree (l tree)
  (reduce (lambda (tr x) (add-val-tree x tr))
          l
          :initial-value tree))

(add-list-tree '(5 3 7) '())
; => (5 (3 () ()) (7 () ()))
