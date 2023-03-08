(defun my-cmp (a b)
  (cond ((< a b) "less")
        ((> a b) "more")
        (T nil)))

(defun unsafe-cmp-n (nfunc l1 l2)
  "does not check length"
  (my-cmp (funcall nfunc l1)
          (funcall nfunc l2)))

(defun somef (predicates &rest lists)
  "Apply predicates to lists and return result of first predicate which result
  is not nil"
  (some (lambda (p) (apply #'unsafe-cmp-n p lists))
        predicates))

(defun cmp3 (l1 l2)
  (cond ((<= (length l1) 2) nil)
        ((<= (length l2) 2) nil)
        (T (let ((cmp-res (somef '(first second third) l1 l2)))
             (if cmp-res
               cmp-res
               "first 3 element are equal")))))

(cmp3 '(1 2 3 4) '(1 3 2 4 5))
; => "less"

(cmp3 '(1 2 3 4) '(1 0 2 4 5))
; => "more"

(cmp3 '(1 2 3 4) '(1 2 3 4 5))
; => "first 3 element are equal"
