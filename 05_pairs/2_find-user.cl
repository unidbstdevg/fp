(defun find-user (key users)
  (defun iter (users)
    (destructuring-bind (x &rest resta) users
      (cond ((string= key (car x)) x)
            ((null resta) nil)
            (T (iter resta)))))
  (iter users))

(defparameter user-ages
  (list (cons "Anny" 20)
        (cons "Kate" 38)
        (cons "Jack" 31)))
(find-user "Jack" user-ages)
(find-user "Kate" user-ages)
(find-user "Mike" user-ages)
