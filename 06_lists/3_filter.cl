(defun filter-even (l)
  (remove-if-not #'evenp l))

(defun filter-odd (l)
  (remove-if-not #'oddp l))

(defun div-by-n-p (x n)
  (= 0 (mod x n)))

(defun filter-div-by-2-and-3 (l)
  (remove-if-not (lambda (x) (and (div-by-n-p x 2)
                                  (div-by-n-p x 3)))
                 l))

(defun filter-div-by-2-or-sqr-greater-than-10 (l)
  (defun sqr-greater-than-10-p (x)
    (> (* x x) 10))
  (remove-if-not (lambda (x) (or (div-by-n-p x 2)
                                 (sqr-greater-than-10-p x)))
                 l))

;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter l '(1 2 3 4 5 6 7 8 9 10))

(filter-even l)
; Число четное.       => '(2 4 6 8 10)

(filter-odd l)
; Число нечетное.       => '(1 3 5 7 9)

(filter-div-by-2-and-3 l)
; Число делится на 2 и на 3.       => '(6)

(filter-div-by-2-or-sqr-greater-than-10 l)
; Число делится на 2 или возведенное в квадрат больше 10.       => '(2 4 5 6 7 8 9 10)
