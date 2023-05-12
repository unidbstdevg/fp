(load "utils.cl")
(load "1_add_list.cl")

; Написать функцию (leaf-tree tree), которая возвращает число листьев  в дереве
; tree.

(defun leaf-tree (tree)
  ; (defun good (tree))
  (cond ((null tree) 0)
        ((and (null (get-left tree)) (null (get-right tree))) 1)
        (t (+ (leaf-tree (get-left tree))
              (leaf-tree (get-right tree))))))

(defparameter tree (add-list-tree '(5 3 7 4 2 6 8) '()))
(leaf-tree tree)
; => 4
