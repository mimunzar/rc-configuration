(defpackage :${PROJECT_NAME}-test
  (:use :cl :fiveam)
  (:export #:main))
(in-package :${PROJECT_NAME}-test)


(test this-fails
  (is (= 1 2)))

(defun main ()
  (run-all-tests))

