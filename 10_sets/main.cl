; 1. Объединение.
; 2. Пересечение.
; 3. Разность.
; 4. Симметрическая разность.

; Для проверки принадлежности элемента множеству необходимо написать функцию,
; возвращающую ИСТИНУ или ЛОЖЬ, в зависимости от того, принадлежит или нет
; элемент множеству

(defun inSetp (x l)
  (numberp (position x l)))

(defun uni (x y)
  (remove-duplicates (append x y)))

(defun inters (x y)
  (loop for a in x
        when (inSetp a y)
        collect a))

(defun diff (x y)
  (loop for a in x
        when (not (inSetp a y))
        collect a))

(defun sym-diff (x y)
  (diff (uni x y)
        (inters x y)))

(inSetp 1 '(2 3 4))
; => #f
(inSetp 2 '(2 3 4))
; => #t

(uni '(2 3 4) '(3 4 5))
; => (2 3 4 5)
(uni '() '(3 4 5))
; => (3 4 5)

(inters '(2 3 4) '(3 4 5))
; => (3 4)
(inters '() '(3 4 5))
; => ()

(diff '(2 3 4) '(3 4 5))
; => (2)
(diff '(3 4) '(5))
; => (3 4)

(sym-diff '(2 3 4) '(3 4 5))
; => (2 5)
(sym-diff '(3 4) '(5))
; => (3 4 5)
