(load "utils.cl")
(in-package #:pipes)

; 2. Напишите процедуру, возвращающую поток чисел Фибоначчи.

(defun fibonachi-starting-from (n)
  (defun iter (p pp)
    (make-pipe p (iter pp (+ p pp))))
  (last (pipe-values (iter 0 1) n)))

(printN 5 (fibonachi-starting-from 7))
; => 13 21 34 55 89 'done
