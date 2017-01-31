# ROS terminal command

## rosdep
```
rosdep update
rosdep install -y --from-paths . --ignore-src --rosdistro=indigo
```

## rosrun
```
rosrun [--prefix cmd] [--debug] PACKAGE EXECUTABLE [ARGS]
```
e.g. `rosrun turtlesim turtlesim_node __name:=my_turtle`

## launch
check the usage with `roslaunch -h`

## rostopic
```
rostopic list -v
```

## rosbag
record all the topics, using
```
rosbag record -a
```
record the topics we interested in 
```
rosbag record -O subset /topic1/name /topic2/name
```
check the info of a bag
```
rosbag info <bagfile>
```
change the rate of publishing topics
```
rosbag play -r 2 <bagfile>
```


## TF related
### TF echo
```
rosrun tf tf_echo <source frame> <target frame>
```
e.g. `rosrun tf tf_echo /map /odom`

### View Frames
```
rosrun tf2_tools view_frames.py
evince frames.pdf
```

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