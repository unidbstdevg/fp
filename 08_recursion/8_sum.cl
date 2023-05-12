; 8. Написать функцию, суммирующую все элементы списка. Функция должна
; использовать define, cond, if, car, cdr. Например,

(defun sum_items (l)
  (defun iter (l accum)
    (cond ((null l) accum)
          (t (destructuring-bind (a &rest resta) l
               (iter resta (+ a accum))))))
  (iter l 0))

(sum_items '(1 2 3 4 5 6))
; => 21
(sum_items '(1 2 3))
; => 6
(sum_items '())
; => 0
(sum_items '(10))
; => 10
