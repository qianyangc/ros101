/** 
* This program requests service named /spawn, service type turtlesim::Spawn
*/

#include <ros/ros.h>
#include <turtlesim/Spawn.h>

int main(int argc, char** argv)
{
	// initialise ROS node
	ros::init(argc, argv, "turtle_spawn");
	
	// create node handle
	ros::NodeHandle node;

	// search for service /spawn, create client [ros::ServiceClient] and connect to /spawn
	ros::service::waitForService("/spawn");
	ros::ServiceClient add_turtle = node.serviceClient<turtlesim::Spawn>("/spawn");

	// initialise turtlesim::Spawn service data
	turtlesim::Spawn srv;
	srv.request.x = 2.0;
	srv.request.y = 2.0;
	srv.request.name = "turtle2";

	// request for service
	ROS_INFO("Call service to spawn turtle[x:%0.6f, y:%0.6f, name:%s]", srv.request.x, srv.request.y, srv.request.name.c_str());

	add_turtle.call(srv);

	// show service call result
	ROS_INFO("Spawn turtle successfully [name:%s]", srv.request.name.c_str());

	return 0;
}
