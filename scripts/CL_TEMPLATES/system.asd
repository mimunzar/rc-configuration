(asdf:defsystem "${PROJECT_NAME}"
  :pathname "src/"
  :components ((:file "main")))

(asdf:defsystem "${PROJECT_NAME}/test"
  :depends-on ("${PROJECT_NAME}" "fiveam")
  :pathname "test/"
  :components ((:file "main-test")))

