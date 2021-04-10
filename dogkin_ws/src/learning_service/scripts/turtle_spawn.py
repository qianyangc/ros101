#!/usr/bin/env python
# -*- coding:utf-8 -*-
# This program creates Client called "/turtle_spawn" for Service named "/spawn", datatype <turtlesim::Spawn>

import sys
import rospy
from turtlesim.srv import Spawn

def turtle_spawning():
	# create node	
	rospy.init_node('turtle_spawn')
	
	# wait for service /spawn of datatype <Spawn>	
	rospy.wait_for_service('/spawn')
	try:
		add_turtle = rospy.ServiceProxy('/spawn', Spawn)
		
		# when server is found, initialise service data (x, y, name)
		response = add_turtle(2.0, 2.0, 0.0, "turtle2")
		return response.name
	except rospy.ServiceException, e:
		print("Service call failed: %s" %e)


if __name__ == '__main__':
	# request for service and show result	
	print('Spawn turtle successfully [name:%s]' %(turtle_spawning()))

