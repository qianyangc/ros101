#!/usr/bin/env python
# -*- coding:utf-8 -*-
# this script creates a node <person_client>, utilises service </show_person>, service data type <learning_service::Person>

import sys
import rospy
from learning_service.srv import Person, PersonRequest

def personClient():
	# initialise ros node
	rospy.init_node('person_client')
	
	# wait for service, once discovered create a client instance
	rospy.wait_for_service('/show_person')
	try:
		# create service instance
		p_client = rospy.ServiceProxy('/show_person', Person)
		
		# when server is found, send request data (name, age, sex)
		response = p_client("Bar", 3, PersonRequest.male)
		return response.result
	except rospy.ServiceException, e:
		print("Service call failed: %s" %e)	
	

if __name__ == "__main__":
	print("Request result: %s" %(personClient()))
