(defun make-polar-pair (radius degree)
  (cons radius degree))

(defun get-polar-pair-radius (pair)
  (car pair))
(defun get-polar-pair-degree (pair)
  (cdr pair))

(defparameter pp (make-polar-pair 7 54))
(get-polar-pair-radius pp)
(get-polar-pair-degree pp)
