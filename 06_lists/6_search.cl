(defun myfind (key l)
  (defun iter (l)
    (if (null l)
      nil
      (destructuring-bind (x &rest resta) l
        (cond ((= key x) x)
              (t (iter resta))))))
  (iter l))

(defparameter l '(1 2 3 4 5 6 7 8 9 10))
(find 3 l)
(myfind 3 l)

(myfind 3 '())
(myfind 3 '(2))
(myfind 3 '(1 3))
(myfind 3 '(3))
(myfind 3 '(3 4))

; 6. Поиск элемента в списке. Дан список из 10 элементов '(1 2 3 4 5 6 7 8 9
; 10). Напишите функции, которые производят поиск элемента в списке следующии
; способами:

; Прямым перебором элементов (линейный поиск).
; (*) Бинарным (двоичным) поиском.
