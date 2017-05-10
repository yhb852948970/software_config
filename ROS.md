ROS terminal command
====================

# roscore
1. rosdep
  ```
rosdep update
rosdep install -y --from-paths . --ignore-src --rosdistro=indigo
  ```

##2. rosrun
  ```
rosrun [--prefix cmd] [--debug] PACKAGE EXECUTABLE [ARGS]
  ```
- e.g. `rosrun turtlesim turtlesim_node __name:=my_turtle`

##3. launch
check the usage with `roslaunch -h`

##4. rostopic
```
rostopic list -v
```

##5. rosbag
- record all the topics, using
  ```
rosbag record -a
  ```
- record the topics we interested in 
  ```
rosbag record -O subset /topic1/name /topic2/name
  ```
- check the info of a bag
  ```
rosbag info <bagfile>
  ```
- change the rate of publishing topics
  ```
rosbag play -r 2 <bagfile>
  ```
##6. rostest
- run test for specific package
  ```
  catkin_make run_tests -DCATKIN_WHITELIST_PACKAGES="package_name"
  ```

# TF related
Using ros bag to publish TF, but remove a specific frame in that tf.[here](tf_filter.txt)

# ROS programming
## ROS CMakeLists.txt

cmake_minimum_required() <br />
project() <br />
find_package() <br />
add_message_files(), add_service_files(), add_action_files(), all catkin-specific <br />
generate_messages(), catkin-specific <br />
catkin_package(), catkin-specific <br />
add_library(), add_executable(), target_link_libraries() <br />
install() <br />
catkin_add_gtest(), catkin_add_nosetests(), add_rostest(), add_rostest_gtest(), all catkin-specific <br />
