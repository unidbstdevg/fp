; 6. Дано натуральное число N. Вычислите сумму его цифр. При решении этой
; задачи нельзя использовать строки, списки, массивы циклы. Применяем define,
; cond, modulo, remainder. Например,

(defun splitNum (n)
  (defun iter (restn accum)
    (cond ((<= restn 0) accum)
          (t (multiple-value-bind (q r) (floor restn 10)
               (iter q (cons r accum))))))
  (iter n '()))

(defun sumDigit (n)
  (reduce #'+ (splitNum n)))

(sumDigit 123456789987654321)
; => 90
(sumDigit 54)
; => 9
(sumDigit 543)
; => 12
