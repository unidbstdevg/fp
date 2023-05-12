; 1. Написать функцию возведения в степень, которая получает на вход 2
; аргумента – число и степень, а возвращает результат возведения. Например,

(defun toPow (k m)
  (cond ((eq m 0) 1)
        ((> m 0) (reduce #'* (make-list m :initial-element k)))
        ((< m 0) (reduce #'/ (make-list (abs m) :initial-element k)
                         :initial-value 1))))

(toPow 2 4)
; => 16
(toPow 9 -2)
; => 1/81
(toPow 3 0)
; => 1
