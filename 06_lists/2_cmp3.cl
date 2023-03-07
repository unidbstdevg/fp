(defun my-cmp (a b)
  (cond ((< a b) "less")
        ((> a b) "more")
        (T nil)))

(defun unsafe-cmp-n (nfunc l1 l2)
  "does not check length"
  (my-cmp (funcall nfunc l1)
          (funcall nfunc l2)))

(defmacro macro-cmp-n (l1 l2 fns endstring)
  "this applies fns one by one and if for some of them we got string (which
   means that elements are not equal, and this string says how they related) it
   returns this string as result"
  (if (endp fns)
    endstring
    (destructuring-bind (fn &rest resta) fns
      `(let ((res (unsafe-cmp-n ,fn l1 l2)))
         (if res
           res
           (macro-cmp-n l1 l2 ,resta ,endstring))))))

(defun cmp3 (l1 l2)
  (cond ((<= (length l1) 2) nil)
        ((<= (length l2) 2) nil)
        (T (macro-cmp-n l1 l2 (#'first #'second #'third) "first 3 element are equal"))))

(cmp3 '(1 2 3 4) '(1 3 2 4 5))
; => "less"

(cmp3 '(1 2 3 4) '(1 0 2 4 5))
; => "more"

(cmp3 '(1 2 3 4) '(1 2 3 4 5))
; => "first 3 element are equal"
