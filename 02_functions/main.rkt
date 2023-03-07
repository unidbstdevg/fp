#lang racket

(define (far-cel F) (* (/ 5 9) (- F 32)))
(far-cel 451.)

(define (cel-far C) (+ 32 (* C (/ 9 5))))
(cel-far 37.5)

(display "\n")

(define (sci a b) (* a (expt 10 b)))
(sci 7 3)
(sci 42. -5)

(display "\n")

(define (tiph a) (* a 0.15))
(define (tipsum a) (+ a (tiph a)))
(define (tip a) (+ (tiph a) (- (ceiling (tipsum a)) (tipsum a))))
; (define (tipt a) (+ a (tip a)))
(tip 29.23)
; => 4.77
(tip 7.54)
; => 1.46
