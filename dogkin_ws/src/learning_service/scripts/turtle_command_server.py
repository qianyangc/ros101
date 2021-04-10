#!/usr/bin/env python
# -*- coding:utf-8 -*-
# this script executes service named /turtle_command, service data type std_srvs/Trigger

import rospy
import thread, time
from geometry_msgs.msg import Twist
from std_srvs.srv import Trigger, TriggerResponse

# flag to switch motion on and off
pubCommand = False
# publisher to control turtle velocity, publishes to topic '/turtle1/cmd_vel'
turtle_vel_pub = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)

# create a thread to publish velocity
def command_thread():
	while True:
		if pubCommand:
			vel_msg = Twist()
			vel_msg.linear.x = 0.5
			vel_msg.angular.z = 0.2
			turtle_vel_pub.publish(vel_msg)
		# delay next publication for 0.1 seconds
		time.sleep(0.1)

# service callback function, activated when request is received
def commandCallback(req):
	# make pubCommand global	
	global pubCommand
	pubCommand = bool(1-pubCommand)

	# show request message
	rospy.loginfo("Publish turtle velocity command![%d]", pubCommand)

	# return response message, parameters (bool) success, (string) message 
	return TriggerResponse(1, "Change turtle command state")

# server function
def turtle_command_server():
	# initialise ros node
	rospy.init_node('turtle_command_server')

	# create a server named [turtle_command] and register callback function
	s = rospy.Service('/turtle_command', Trigger, commandCallback)

	# wait for service request
	print("Ready to receive turtle command.")

	# start a new thread to control turtle velocity
	thread.start_new_thread(command_thread, ())
	rospy.spin()

if __name__ == "__main__":
	turtle_command_server()

