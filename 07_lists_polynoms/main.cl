(defun align-lists (filler &rest lists)
  (let* ((lens (mapcar #'length lists))
         (max-len (apply #'max lens))
         (diffs (mapcar (lambda (x) (- max-len x)) lens)))
    (mapcar
      (lambda (l diff) (append l (make-list diff :initial-element filler)))
      lists diffs)))


(defun padd (p1 p2)
  (apply #'mapcar #'+ (align-lists 0 p1 p2)))

(defun pmulc (p c)
  (mapcar (lambda (x) (* x c)) p))

(defun shift (p m)
  (append
    (make-list m :initial-element 0)
    p))

(defun pmulm (p m c)
  (pmulc (shift p m) c))

(defun calcp (p x)
  (apply #'+
    (loop for power from 0 and k in p
          collect (* k (expt x power)))))

(padd '(1 1) '(0 1 1))
; => (1 2 1)
(padd '(1 2) '(3 4 5))
; => (4 6 5)

(pmulc '(1 2 3) 10)

(pmulm '(1 2) 2 5)
; => (0 0 5 10)

(calcp '(1 2) 0.7)
; => 2.4
