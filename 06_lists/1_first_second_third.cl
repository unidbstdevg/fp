(defun myfirst (l)
  (if (= 0 (length l))
      nil
      (car l)))

(myfirst '(1 2))
(myfirst '(1))
(myfirst '())

(defun mysecond (l)
  (if (<= (length l) 1)
      nil
      (car (cdr l))))

(mysecond '(1 2))
(mysecond '(1))
(mysecond '())

(defun mythird (l)
  (if (<= (length l) 2)
      nil
      (car (cdr (cdr l)))))


(mythird '(1 2 3))
(mythird '(1 2))
(mythird '(1))
(mythird '())
