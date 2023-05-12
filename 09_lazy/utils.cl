(load "~/.quicklisp/setup.lisp")
(ql:quickload :pipes)
(in-package #:pipes)

(defun printN (n l)
  (format t "~S" (pipe-values l (- n 1))))
