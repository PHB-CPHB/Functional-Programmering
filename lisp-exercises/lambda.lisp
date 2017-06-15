;;
;; Prelude
;;

;; Lambdas are defined by the syntax (lambda (arguments) body)
(lambda (a) (+ a 2))

;; Lambdas should be called with the funcall function
(funcall (lambda (a) (+ a 2)) 4) ;; 6

;;
;; Exercises
;;

;; Exercise 1
;; Call this lambda in the same line!
(write-string "Exercise 1 - " nil)
(write (funcall (lambda (a b) (+ a b)) 2 3))
(write-char #\newline)

;; Exercise 2
;; Write a function that returns the lambda below
(write-string "Exercise 2.1 Function - " nil)
(defun l () (lambda (a) (+ a 3)))
(write (funcall (l ) 9))
(write-char #\newline)

(write-string "Exercise 2.1 Variable - " nil)
(setf v (lambda (a) (+ a 3)))
(write (funcall v 9))
(write-char #\newline)



;; Exercise 3
;; Write a function that returns a lamdda that is run twice on some input.
;; If you had a function in Java (f) this would be written: f(f(4))
(write-string "Exercise 3.1 Function call - " nil)
(write (funcall (l ) (funcall (l ) 9)))
(write-char #\newline)
(write-string "Exercise 3.2 - Variable " nil)
(write (funcall v (funcall v 9)))
