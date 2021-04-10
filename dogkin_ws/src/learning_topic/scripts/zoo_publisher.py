#!/usr/bin/env python
# -*- coding:utf-8 -*-
#This script creates a publisher of topic /resident_sounds, message type [learning_topic::Animal]

import rospy
from learning_topic.msg import Animal

def zoo_publisher():
	rospy.init_node('sound_publisher', anonymous=True)
	zoo_pub = rospy.Publisher('/resident_sounds', Animal, queue_size=10)
	
	# set loop to publish message
	rate = rospy.Rate(10)

	while not rospy.is_shutdown():
		resident = Animal()
		resident.name = "budgie"
		resident.num_calls = 3
		resident.sound = "chirp"

		sound_string = ""
		for i in range(resident.num_calls):
			sound_string += resident.sound
			sound_string += "^"
		
		zoo_pub.publish(resident)		
		rospy.loginfo('A %s calls %s' % (resident.name, sound_string))
		
		rate.sleep()

if __name__ == '__main__':
	try:
		zoo_publisher()
	except rospy.ROSInterruptException():
		pass
			
