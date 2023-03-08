(defun insert-spaces (l)
  (reduce (lambda (x y)
            (if (endp y)
              (cons x y)
              (cons x (cons " " y))))
          l
          :from-end t
          :initial-value '()))

(defun concat-list-strings (&rest lists)
  (apply #'mapcar (lambda (&rest ord)
                    (apply #'concatenate 'string (insert-spaces ord)))
         lists))

(defun myreverse (l)
  (defun iter (l accum)
    (if (endp l)
      accum
      (destructuring-bind (a &rest resta) l
        (iter resta (cons a accum)))))
  (iter l '()))

(defparameter names '("Елена" "Василий"))
(defparameter surnames '("Туманова" "Власов"))
(defparameter patronymics '("Ивановна" "Петрович"))

(concat-list-strings surnames names patronymics)
; ФИО: => '("Туманова Елена Ивановна" "Власов Василий Петрович")

(concat-list-strings names patronymics surnames)
; ИОФ: => '("Елена Ивановна Туманова" "Василий Петрович Власов")

(myreverse (concat-list-strings names patronymics surnames))
; reverse => '("Василий Петрович Власов" "Елена Ивановна Туманова")
