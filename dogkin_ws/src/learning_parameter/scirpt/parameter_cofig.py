#!/usr/bin/env python
# -*- coding: utf-8 -*-
# This script updates backgroun color parameters

import sys
import rospy
from std_srvs.srv import Empty

def parameter_config():
	# initialise a client node to access parameter service
	rospy.init_node('parameter_config', anonymous=True)
	
	# access background color parameters
	red   = rospy.get_param('/background_r')
	green = rospy.get_param('/background_g')
	blue  = rospy.get_param('/background_b')

	rospy.loginfo("Get background color[%d %d %d]", red, green, blue)

	# set background color parameters
	rospy.set_param('/background_r', 255)
	rospy.set_param('/background_g', 255)
	rospy.set_param('/background_b', 255)

	rospy.loginfo("Set background color[255 255 255]")

	# access background color parameters again
	red   = rospy.get_param('/background_r')
	green = rospy.get_param('/background_g')
	blue  = rospy.get_param('/background_b')

	rospy.loginfo("Get background color[%d %d %d]", red, green, blue)

	# update background color by calling [\clear] service
	rospy.wait_for_service('/clear')
	try:
		# set up service proxy 
		# perform command line [$ rosservice call /clear "{}"]
		clear_background = rospy.ServiceProxy('/clear', Empty)
		response = clear_background()
		return response
	except rospy.ServiceException, e:
		print("Service call failed: %s" %e)

if __name__ == "__main__":
	parameter_config()
