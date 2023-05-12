(load "utils.cl")
(in-package #:pipes)

; 3. Написать процедуру filter-stream, которая бы была аналогом функции filter,
; т.е. вызов (filter-stream pred str) порождал бы поток элементов потока str,
; удовлетворяющих предикату pred.

; Т.е. после (define evens (filter-stream even? integers))   evens – это поток
; четных чисел.

(defun my-filter-stream (pred str)
  (if (eq str +empty-pipe+)
    +empty-pipe+
    (let ((head (pipe-head str))
          (tail (pipe-tail str)))
      (if (funcall pred head)
        (make-pipe head (my-filter-stream pred tail))
        (my-filter-stream pred tail)))))

(printN 5 (my-filter-stream #'evenp integers))
