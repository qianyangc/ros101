/**
* This program implements server named <turtle_command_server> which provides service named </turtle_command> of datatype [std_srvs::Trigger]
*/

#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <std_srvs/Trigger.h>

// the server acts as a switch to turn the turtle motion on and off
// need to create publisher to publish velocity when turtle is moving
ros::Publisher turtle_vel_pub;
// command flag: turtle starts switch off
bool pubCommand = false;

// service callback, input param = req, output param = res
bool commandCallback(std_srvs::Trigger::Request &req, std_srvs::Trigger::Response &res)
{
	pubCommand = !pubCommand;
	
	// show request data
	ROS_INFO("Publish turtle velocity command [%s]", pubCommand==true?"Yes":"No");

	// set response
	res.success = true;
	res.message = "Change turtle command state!";

	return true;
}

int main(int argc, char **argv)
{
	// ROS node initialisation
	ros::init(argc, argv, "turtle_command_server");

	// create handle
	ros::NodeHandle n;

	// register server for service named <turtle_command>
	// when service is requested, callBack function will be activated
	ros::ServiceServer command_service = n.advertiseService("/turtle_command", commandCallback);

	// register a publisher and publish to topic/turtle1/cmd_vel, datatype geometry_msgs::Twist, queue_size=10
	// note that the same handle is used here
	turtle_vel_pub = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10);

	// wait for request to activate callback function
	ROS_INFO("Ready to receive turtle command.");

	// set loop rate
	ros::Rate loop_rate(10);

	while(ros::ok())
	{
		//check callback function once
		ros::spinOnce();
	
		// if flagged true, publish to topic
		if(pubCommand)
		{
			geometry_msgs::Twist vel_msg;
			vel_msg.linear.x = 0.5;
			vel_msg.angular.z = 0.2;
			turtle_vel_pub.publish(vel_msg);		
		}
		
		// delay
		loop_rate.sleep();
	}
	
	return 0;
}

