/**
* This script broadcasts transform between world and turtle frame
*/

#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <turtlesim/Pose.h>

std::string turtle_name;

// callback function to activate when pose is published
void poseCallback(const turtlesim::PoseConstPtr& msg)
{
	// define broadcaster
	static tf::TransformBroadcaster br;

	// define and initialise transform
	tf::Transform transform;
	transform.setOrigin( tf::Vector3(msg->x, msg->y, 0.0));
	tf::Quaternion q;
	q.setRPY(0, 0, msg->theta);
	transform.setRotation(q);

	// broadcast transform between world and turtle frame with time
	br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", turtle_name));
}

int main(int argc, char** argv)
{
	// initialise ROS node for broadcaster
	ros::init(argc, argv, "my_tf_broadcaster");

	// check and acquire turtle_name parameter
	if (argc != 2)
	{
		ROS_ERROR("need turtle name as argument");
		return -1;	
	}
	
	turtle_name = argv[1];

	// subscribe to turtle pose
	ros::NodeHandle node;
	ros::Subscriber sub = node.subscribe(turtle_name+"/pose", 10, &poseCallback);

	// wait for pose to be published then activate callback 
	ros::spin();

	return 0;
	
}
