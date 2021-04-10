/**
* This program subscribes to topic /turtle1/pose, message type [turtlesim::Pose]
*/

#include <ros/ros.h>
#include "turtlesim/Pose.h"

// callback function to act when message comes in
void poseCallback(const turtlesim::Pose::ConstPtr& msg)
{
	ROS_INFO("Turtle pose: x:%0.6f, y:%0.6f", msg->x, msg->y);
}

int main(int argc, char **argv)
{
	// initialise ROS node
	ros::init(argc, argv, "pose_subscriber");

	// create handle
	ros::NodeHandle n;

	// create a Subscriber, subscribe to topic /turtle1/pose, with callBack function [poseCallback] and queue length 10
	ros::Subscriber pose_sub = n.subscribe("turtle1/pose", 10, poseCallback);

	// wait for message to come
	ros::spin();

	return 0; 
}
