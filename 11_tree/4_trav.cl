(load "utils.cl")
(load "1_add_list.cl")

; Написать функцию (lr-travel-tree tree lst), которая для заданного BST дерева
; возвращает список, содержащий все элементы дерева в порядке обхода «слева
; направо», т.е. сначала все элементы левого поддерева, потом корень, потом все
; элементы правого поддерева.

(defun lr-travel-tree (tree)
  (defun iter (tr accum_result accum_rest)
    (cond ((and (null tr) (null accum_rest)) accum_result)
          ((null tr) (destructuring-bind (ntr &rest naccum_rest) accum_rest
                       (iter (get-right ntr)
                             (cons (get-val ntr) accum_result)
                             naccum_rest)))
          (t (iter (get-left tr)
                   accum_result
                   (cons tr accum_rest)))))
  (nreverse (iter tree '() '())))

(lr-travel-tree (add-list-tree '(5 3 7 4 2 6 8) '()))
; => (2 3 4 5 6 7 8)
