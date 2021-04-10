#!/usr/bin/env python
# -*- coding:utf-8 -*-
# This script creates a publisher for topic /person_info, with message type learning_topic::Person

import rospy
from learning_topic.msg import Person

def person_pub():
	rospy.init_node('person_publisher', anonymous=True)
	person_pub = rospy.Publisher('/person_info', Person, queue_size=10)
	
	# set loop rate and publish message in a loop
	rate = rospy.Rate(10)

	while not rospy.is_shutdown():
		infoMsg = Person()
		infoMsg.name = "Santa"
		infoMsg.sex = Person.male
		infoMsg.age = 31415926

		person_pub.publish(infoMsg)
		if infoMsg == 1:
			rospy.loginfo('Publish person info: %s is a guy and he is %d years old!' % (infoMsg.name, infoMsg.age))
		elif infoMsg == 2:
			rospy.loginfo('Publish person inf: %s is a gal and she is %d years old!' % (infoMsg.name, infoMsg.age))
		else:
			rospy.loginfo('Publish person info: %s is %d years old with unknown gender!' % (infoMsg.name, infoMsg.age))

		rate.sleep()

if __name__ == '__main__':
	try:
		person_pub()
	except rospy.ROSInterruptException:
		pass

	
