#lang racket

; 1. Напишите процедуры, которые вычисляют минимум и максимум из двух своих
; аргументов. Функциями min, max пользоваться нельзя! Применяйте условные
; выражения
(define (ma a b)
  (if (> a b) a b))
(ma 3 4)
(define (mi a b)
  (if (< a b) a b))
(mi 3 4)
(display "\n")

; 2. Напишите процедуру, принимающую аргументами 3 числа и возвращающую сумму
; квадратов больших из них. Например,
(define (fun a b c)
  (if (> a b)
      (+ (* a a) (
                  if (> b c)
                     (* b b)
                     (* c c)))
      (+ (* b b) (
                  if (> a c)
                     (* a a)
                     (* c c)))))

(fun 1 2 3)
(fun 1 3 2)

(fun 2 1 3)
(fun 2 3 1)

(fun 3 2 1)
(fun 3 1 2)
(display "\n")

; 3. Напишите предикат teen? который возвращает #t (истину), если его
; аргумент находится между 13 и 19. Например,

(define (teen? x)
  (if (and (> x 13) (< x 19)) #t #f))

(teen? 13)

(teen? 14)
(teen? 15)
(teen? 18)

(teen? 19)
(display "\n")

; 4. Напишите предикат valid-date? который принимает в качестве
; аргументов три числа: день, месяц и год. Предикат должен вернуть #t
; (истина), если числа представляют собой действительную дату (например,
; это не 31 сентября). В феврале 29 дней, если его год: кратен 400, не
; кратен 100, кратен 4. Например, годы 1700, 1800, 1900, 2100, 2200, 2300
; - невисокосные, в их феврале 28 дней.

(define (valid_day d) (and (> d 0) (< d 32)))
(define (valid_month m) (and (> m 0) (< m 13)))
(define (valid_year y) (> y 1581))

(define (check_days_in_month d m y)
  (cond
    ((member m (list 1 3 5 7 8 10 12)) (<= d 31))
    ((member m (list 4 6 9 11))        (<= d 30))
    ((= m 2) (check_leap_year_days d y))
    (else #f)))

(define (is_leap_year y)
  (cond
    ((= 0 (modulo y 400)) #t)
    ((= 0 (modulo y 100)) #f)
    ((= 0 (modulo y 4)) #t)))

(define (check_leap_year_days d y)
  (if (is_leap_year y)
      (= d 29)
      (= d 28)))

(define (valid-date? d m y)
  (and (valid_day d) (valid_month m) (valid_year y)
       (check_days_in_month d m y)))


(valid-date? 7 8 1949)
; => #t

(valid-date? -7 8 1949)
; ; => #f

(valid-date? 1 0 1949)
; ; => #f

(valid-date? 29 2 1900)
; ; => #f

(valid-date? 29 2 2000)
; ; => #t
