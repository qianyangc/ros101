/**
* This script listens to transform of both /turtle1 and /turtle2, publish velocity to /turtle2 such that it tracks position of /turtle1
*/

#include <ros/ros.h>
#include <tf/transform_listener.h>
#include <geometry_msgs/Twist.h>
#include <turtlesim/Spawn.h>

#define ANGULAR_RATE 4.0
#define LINEAR_RATE 0.5

int main(int argc, char** argv)
{
	// initialise ROS node and create handle
	ros::init(argc, argv, "my_tf_listener");
	ros::NodeHandle node;

	// create turtle2 (Client-Server model)
	ros::service::waitForService("/spawn");
	ros::ServiceClient add_turtle = node.serviceClient<turtlesim::Spawn>("/spawn");
	turtlesim::Spawn srv;	
	add_turtle.call(srv);

	// for turtle2 velocity publication(Publisher-Subscriber model)
	ros::Publisher turtle_vel = node.advertise<geometry_msgs::Twist>("/turtle2/cmd_vel", 10);
	
	// create tf listener
	tf::TransformListener listener;
	
	// how often should we run while loop (unit:Hz)
	ros::Rate rate(10.0);
	while (node.ok())
	{
		// acquire transform between turtle1 and turtle2
		tf::StampedTransform transform;
		try
		{
			// wait for transforms (3.0 seconds before fail it), if both available, jump to lookup
			listener.waitForTransform("/turtle2", "/turtle1", ros::Time(0), ros::Duration(3.0));	
			listener.lookupTransform("/turtle2", "/turtle1", ros::Time(0), transform);	
		}
		catch (tf::TransformException &ex)
		{	
			// if there is error, wait for 1 second and start the loop from begining again
			ROS_ERROR("%s", ex.what());
			ros::Duration(1.0).sleep();
			continue;		
		}
		
		// found both coordinates, publish velocity to turtle2
		geometry_msgs::Twist vel_msg;
		vel_msg.angular.z = ANGULAR_RATE * atan2(transform.getOrigin().y(), transform.getOrigin().x());
		vel_msg.linear.x = LINEAR_RATE * sqrt(pow(transform.getOrigin().x(), 2) + pow(transform.getOrigin().y(), 2));
		turtle_vel.publish(vel_msg);
		
		rate.sleep();
	}
	return 0;
}
