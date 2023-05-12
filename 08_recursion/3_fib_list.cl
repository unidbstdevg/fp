; 3. Написать функцию для показа ряда Фибоначчи. Применяем итеративные функции,
; define, cond, cons. Аргумент функции - количество чисел в ряду Фибоначчи.
; Например,

(defun fibonacci (k)
  (defun iter (p pp i accum)
    (cond ((>= i k) (nreverse accum))
          (t (iter pp (+ p pp) (+ i 1) (cons pp accum)))))
  (iter 1 1 1 '()))

(fibonacci 10)
; => (1 2 3 5 8 13 21 34 55)
