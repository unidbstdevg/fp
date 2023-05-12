; 7. Написать функцию, которая создает список из пустых элементов заданной
; длины N. Функция должна использовать итерации, define, cond, cons. Например,

(defun getN_list (n)
  (defun iter (i accum)
    (cond ((>= i n) accum)
          (t (iter (+ i 1) (cons '() accum)))))
  (iter 0 '()))

(getN_list 10)
; => (() () () () () () () () () ())
(getN_list 3)
; => (() () ())
