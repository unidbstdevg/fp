; 5. Дано натуральное число N. Выведите "yes", если число N является точной
; степенью двойки, или "no" в противном случае. Операцией возведения в степень
; пользоваться нельзя! Можно использовать define, cond, modulo, remainder.
; Например,

(defun checkPow2 (n)
  (defun iter (p)
    (cond ((= p n) "yes")
          ((> p n) "no")
          (t (iter (* p 2)))))
  (iter 1))

(checkPow2 7)
; => "no"
(checkPow2 16)
; => "yes"
(checkPow2 1)
; => "yes"
