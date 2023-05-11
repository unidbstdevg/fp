(defparameter *vowels* '(#\a #\e #\i #\o #\u))
(defun vowelp (c)
  (find c *vowels*))

(defun str-to-list (str)
  (coerce str 'list))
(defun list-to-string (lst)
  (coerce lst 'string))

(defun split_till_first_vowel (word)
  (defun recur (consons rest_word)
    (cond ((null rest_word) (values consons '()))
          ((vowelp (first rest_word)) (values consons rest_word))
          (t (recur (append consons (list (first rest_word))) (rest rest_word)))))
  (recur '() word))

;; все первые согласные (до первой гласной) переносим в конец
;; дописываем в конец ay

(defun pig-latin (words)
  (defun f (word)
    (multiple-value-bind (a b) (split_till_first_vowel (str-to-list word))
      (list-to-string (append b a (str-to-list "ay")))))
  (mapcar #'f words))

;;;;;;;;
;; tests

(pig-latin '("hello" "world"))
;; => "ellohay orldway"

(pig-latin '("ok"))
;; => "okay"

(pig-latin '("you"))
;; => "ouyay"

(pig-latin '("this" "is" "an" "example" "of" "Hog" "Lati." "as" "you" "can"
             "see" "it's" "silly" "but" "lots" "of" "fun" "for" "children"))
;; => "isthay isay anay exampleay ofay ogHay ati.Lay asay ouyay ancay eesay
;; it’say illysay utbay otslay ofay unfay orfay ildrenchay"

;; 8. Напишите процедуру, реализующую шифрование поросячей латынью: в качестве
;; аргумента передается список слов, а возвращаются преобразованные слова
;; (списком слов или строкой из слов). Можно применять строковые функции Racket:
;; string-ref, string-length, string-append, substring, string-join.
