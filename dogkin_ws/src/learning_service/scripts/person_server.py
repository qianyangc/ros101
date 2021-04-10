#!/usr/bin/env python
# -*- coding: utf-8 -*-
# this script creates node <person_server>, utilises service </show_person>, service data type <learning_service::Person>

import rospy
from learning_service.srv import Person, PersonResponse

# callback funciton updates and returns response message
def personCallback(req):
	rospy.loginfo("Show person info: name <%s>, age <%d>, gender <%d>", req.name, req.age, req.sex)
	return PersonResponse("callback response = success")

def personServer():
	# initialise node
	rospy.init_node('person_server')

	# create server and register callback function
	s = rospy.Service('/show_person', Person, personCallback)

	# wait for request
	print("Ready to receive person info request")
	rospy.spin()

if __name__ == "__main__":
	personServer()
