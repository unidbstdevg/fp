(load "utils.cl")
(in-package #:pipes)


; 1. Напишите процедуру, возвращающую поток факториалов, т.е. 1 2 6 24 120 …,
; если просят начать с единицы. Подсказка – промежуточная функция будет иметь
; два параметра.

(defun factorials-starting-from (n)
  (defun iter (p accum)
    (let ((naccum (* p accum))
          (np (+ p 1)))
      (make-pipe accum (iter np naccum))))
  (last (pipe-values (iter 1 1) n)))

(printN 5 (factorials-starting-from 3))
; => 6 24 120 720 5040 'done
