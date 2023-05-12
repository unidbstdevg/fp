; 4. Функция Аккермана. Даны два целых неотрицательных числа m и n - аргументы
; функции. Выведите A(m,n):

(defun acker (m n)
  (cond ((= m 0) (+ n 1))
        ((and (> m 0) (= n 0)) (acker (- m 1) 1))
        ((and (> m 0) (> n 0)) (acker (- m 1) (acker m (- n 1))))))
; P.S. there is no tail-recursion

(acker 2 5)
; => 13
(acker 2 2)
; => 7
(acker 2 9)
; => 21
