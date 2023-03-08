(defun sum (l)
  (reduce #'+ l))

(defun sum-even (l)
  (reduce #'+ (remove-if-not #'evenp l)))

(defun diff-odd (l)
  (reduce #'- (remove-if-not #'oddp l)))

;;;;;;;;;;;;

(defparameter l '(1 2 3 4 5 6 7 8 9 10))

(sum l)
; Сумму всех элементов в списке.

(sum-even l)
; Сумму четных элементов в списке.

(diff-odd l)
; Разность нечетных элементов в списке.


; (*) Результат деления последнего элемента на предшествующие элементы. Не
; использовать функцию reverse.
; comment: idk what means "предшествующие элементы". Sum of them? Or div each
; by next? Or should I construct list of results of divides of last element
; with each of element in list?

; (*) Результат деления первого элемента на последующие элементы. Не
; использовать функцию reverse.
; comment: (see previous comment)
