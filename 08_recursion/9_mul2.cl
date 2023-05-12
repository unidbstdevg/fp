; 9. Написать функцию, умножающую все элементы списка на два. Функция должна
; использовать define, if, cons, car, cdr.  Например,

(defun mul2items (l)
  (defun iter (l accum)
    (cond ((null l) accum)
          (t (destructuring-bind (a &rest resta) l
               (iter resta (cons (* 2 a) accum))))))
  (nreverse (iter l '())))

(mul2items '(1 2 3 4 5 6))
; => (2 4 6 8 10 12)
