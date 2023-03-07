(defun is_different (f left right)
  (not (= (signum (funcall f left))
          (signum (funcall f right)))))

(defun calc-middle (left right)
  (/ (+ right left)
     2))

(defun good-enough-p (f x eps)
  (<= (abs (funcall f x))
     eps))

(defun bisection (f left right eps)
  (defun iter (left right)
    (let ((middle (calc-middle left right)))
      (if (good-enough-p f middle eps)
        middle
        (cond ((is_different f left middle) (iter left middle))
              ((is_different f middle right) (iter middle right))
              (t "No solutions")))))
  (iter left right))

(bisection (lambda (x) x) -1 4.0 0.001)
(bisection (lambda (x) (sin x)) 2.0 4.0 0.001)
(bisection (lambda (x) (cos x)) 0 2.0 0.001)
(bisection (lambda (x) (* x x)) 1 2 0.001)
(bisection (lambda (x) (* x x x)) -1 1 0)
