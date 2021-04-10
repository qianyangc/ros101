/**
* This script is Publisher of topic /turtle1/cmd_vel, message type [geometry_msgs::Twist]
*/

#include <ros/ros.h>
#include <geometry_msgs/Twist.h>

#define LONG_PI 3.141592653589793238462643383279502884L

int main(int argc, char **argv)
{
	// initialise ROS node
	ros::init(argc, argv, "velocity_publisher");

	// create node handle 
	ros::NodeHandle n;

	// create Publisher, specify topic name and message type and queue length 10
	ros::Publisher turtle_vel_pub = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel",10);
	
	// set loop rate, same as using [rostopic pub -r] in terminal
	ros::Rate loop_rate(10);

	int count = 0;
	while (ros::ok())
	{
		// initialise geometry_msgs::Twist type message
		geometry_msgs::Twist vel_msg;
		
		if (count % 10 == 0)
		{
			vel_msg.linear.x = 0;				
			vel_msg.angular.z = LONG_PI*2.0/5.0;
		}
		else 
		{
			vel_msg.linear.x = 0.5;			
			vel_msg.angular.z = 0;
		}
		
		// publish message
		turtle_vel_pub.publish(vel_msg);
		ROS_INFO("Publish turtle velocity command[%0.2f m/s, %0.2f rad/s]", vel_msg.linear.x, vel_msg.angular.z);
		
		count++;		
				
		// delay with loop rate
		loop_rate.sleep();	
	}

	return 0;
}
