;; Auto-generated. Do not edit!


(when (boundp 'learning_topic::Animal)
  (if (not (find-package "LEARNING_TOPIC"))
    (make-package "LEARNING_TOPIC"))
  (shadow 'Animal (find-package "LEARNING_TOPIC")))
(unless (find-package "LEARNING_TOPIC::ANIMAL")
  (make-package "LEARNING_TOPIC::ANIMAL"))

(in-package "ROS")
;;//! \htmlinclude Animal.msg.html


(defclass learning_topic::Animal
  :super ros::object
  :slots (_name _num_calls _sound ))

(defmethod learning_topic::Animal
  (:init
   (&key
    ((:name __name) "")
    ((:num_calls __num_calls) 0)
    ((:sound __sound) "")
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _num_calls (round __num_calls))
   (setq _sound (string __sound))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:num_calls
   (&optional __num_calls)
   (if __num_calls (setq _num_calls __num_calls)) _num_calls)
  (:sound
   (&optional __sound)
   (if __sound (setq _sound __sound)) _sound)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; uint8 _num_calls
    1
    ;; string _sound
    4 (length _sound)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint8 _num_calls
       (write-byte _num_calls s)
     ;; string _sound
       (write-long (length _sound) s) (princ _sound s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _num_calls
     (setq _num_calls (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _sound
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sound (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get learning_topic::Animal :md5sum-) "e5d670d018241960bce850ba1516dac3")
(setf (get learning_topic::Animal :datatype-) "learning_topic/Animal")
(setf (get learning_topic::Animal :definition-)
      "string name
uint8 num_calls
string sound


")



(provide :learning_topic/Animal "e5d670d018241960bce850ba1516dac3")


