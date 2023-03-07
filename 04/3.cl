(defun calc-next-collatz (x)
 (if (evenp x)
   (/ x 2)
   (+ 1 (* x 3))))

(defun collatz (n)
  (defun iter (accum)
    (destructuring-bind (x &rest resta) accum
      (if (= x 1)
        (cons 1 resta)
        (let ((nx (calc-next-collatz x)))
          (iter (cons nx (cons x resta)))))))
  (iter (list n)))

(collatz 50)
