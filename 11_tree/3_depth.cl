(load "utils.cl")
(load "1_add_list.cl")

; Написать функцию (depth-tree tree), возвращающую глубину дерева tree.

(defun depth-tree (tree)
  (if (null tree)
      -1
      (+ 1
         (max (depth-tree (get-left tree))
              (depth-tree (get-right tree))))))

(depth-tree (add-list-tree '(5 3 7 4 2 6 8) '()))
; => 2
(depth-tree (add-list-tree '(5) '()))
; => 0
(depth-tree (add-list-tree '(5 2) '()))
; => 1
