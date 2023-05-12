(load "~/.quicklisp/setup.lisp")
(ql:quickload :pipes :silent t)
(in-package #:pipes)

(defun printN (n l)
  (format t "~S" (pipe-values l (- n 1))))

(defun integers-starting-from (n)
  (make-pipe n (integers-starting-from (+ n 1))))

(defvar integers (integers-starting-from 1))
