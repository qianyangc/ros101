
(cl:in-package :asdf)

(defsystem "learning_topic-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Animal" :depends-on ("_package_Animal"))
    (:file "_package_Animal" :depends-on ("_package"))
    (:file "Person" :depends-on ("_package_Person"))
    (:file "_package_Person" :depends-on ("_package"))
  ))