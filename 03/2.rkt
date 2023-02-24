#lang racket

; 2. Напишите процедуру, принимающую аргументами 3 числа и возвращающую сумму
; квадратов больших из них. Например,

(define (fun a b c)
  (if (> a b)
      (+ (* a a) (
                  if (> b c)
                     (* b b)
                     (* c c)))
      (+ (* b b) (
                  if (> a c)
                     (* a a)
                     (* c c)))))

(fun 1 2 3)
(fun 1 3 2)

(fun 2 1 3)
(fun 2 3 1)

(fun 3 2 1)
(fun 3 1 2)