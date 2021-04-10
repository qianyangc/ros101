; Auto-generated. Do not edit!


(cl:in-package learning_topic-msg)


;//! \htmlinclude Animal.msg.html

(cl:defclass <Animal> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (num_calls
    :reader num_calls
    :initarg :num_calls
    :type cl:fixnum
    :initform 0)
   (sound
    :reader sound
    :initarg :sound
    :type cl:string
    :initform ""))
)

(cl:defclass Animal (<Animal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Animal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Animal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name learning_topic-msg:<Animal> is deprecated: use learning_topic-msg:Animal instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Animal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learning_topic-msg:name-val is deprecated.  Use learning_topic-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'num_calls-val :lambda-list '(m))
(cl:defmethod num_calls-val ((m <Animal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learning_topic-msg:num_calls-val is deprecated.  Use learning_topic-msg:num_calls instead.")
  (num_calls m))

(cl:ensure-generic-function 'sound-val :lambda-list '(m))
(cl:defmethod sound-val ((m <Animal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learning_topic-msg:sound-val is deprecated.  Use learning_topic-msg:sound instead.")
  (sound m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Animal>) ostream)
  "Serializes a message object of type '<Animal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_calls)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sound))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sound))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Animal>) istream)
  "Deserializes a message object of type '<Animal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_calls)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sound) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sound) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Animal>)))
  "Returns string type for a message object of type '<Animal>"
  "learning_topic/Animal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Animal)))
  "Returns string type for a message object of type 'Animal"
  "learning_topic/Animal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Animal>)))
  "Returns md5sum for a message object of type '<Animal>"
  "e5d670d018241960bce850ba1516dac3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Animal)))
  "Returns md5sum for a message object of type 'Animal"
  "e5d670d018241960bce850ba1516dac3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Animal>)))
  "Returns full string definition for message of type '<Animal>"
  (cl:format cl:nil "string name~%uint8 num_calls~%string sound~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Animal)))
  "Returns full string definition for message of type 'Animal"
  (cl:format cl:nil "string name~%uint8 num_calls~%string sound~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Animal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     1
     4 (cl:length (cl:slot-value msg 'sound))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Animal>))
  "Converts a ROS message object to a list"
  (cl:list 'Animal
    (cl:cons ':name (name msg))
    (cl:cons ':num_calls (num_calls msg))
    (cl:cons ':sound (sound msg))
))
