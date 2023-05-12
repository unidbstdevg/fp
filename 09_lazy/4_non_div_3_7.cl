(load "utils.cl")
(in-package #:pipes)

; 4. С помощью процедуры filter-stream написать процедуру, порождающую список
; чисел, которые не делятся на 3 и 7.

(defun divp (n divider)
  (zerop (rem n divider)))

(defun non-div-3-7 ()
  (defun goodp (n)
    (not (or (divp n 3) (divp n 7))))
  (pipe-filter (lambda (x) (goodp x))
               integers))

(printN 10 (non-div-3-7))
