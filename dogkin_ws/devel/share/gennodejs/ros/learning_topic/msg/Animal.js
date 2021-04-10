// Auto-generated. Do not edit!

// (in-package learning_topic.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Animal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.num_calls = null;
      this.sound = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('num_calls')) {
        this.num_calls = initObj.num_calls
      }
      else {
        this.num_calls = 0;
      }
      if (initObj.hasOwnProperty('sound')) {
        this.sound = initObj.sound
      }
      else {
        this.sound = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Animal
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [num_calls]
    bufferOffset = _serializer.uint8(obj.num_calls, buffer, bufferOffset);
    // Serialize message field [sound]
    bufferOffset = _serializer.string(obj.sound, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Animal
    let len;
    let data = new Animal(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [num_calls]
    data.num_calls = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [sound]
    data.sound = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.name.length;
    length += object.sound.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'learning_topic/Animal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e5d670d018241960bce850ba1516dac3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    uint8 num_calls
    string sound
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Animal(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.num_calls !== undefined) {
      resolved.num_calls = msg.num_calls;
    }
    else {
      resolved.num_calls = 0
    }

    if (msg.sound !== undefined) {
      resolved.sound = msg.sound;
    }
    else {
      resolved.sound = ''
    }

    return resolved;
    }
};

module.exports = Animal;
