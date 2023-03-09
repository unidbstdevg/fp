(defun f (x n)
  (/ (+ x (/ n x))
     2.0))

(defun good-enough (x n)
  (defparameter eps 0.1)
  (< (abs (- (* x x) n))
     eps))

(good-enough 3.01 9)

(defun mysqrt (n)
  (defun myiter (x)
    (if (good-enough x n)
      x
      (myiter (f x n))))
  (when (>= n 0)
    (myiter 1)))

(mysqrt 169)
