ROS terminal command
====================

# roscore
## 1. rosdep
  ```
rosdep update
cd ~/catkin_ws
rosdep install -y --from-paths ./src --ignore-src --rosdistro=indigo
  ```

## 2. rosrun
  ```
rosrun [--prefix cmd] [--debug] PACKAGE EXECUTABLE [ARGS]
  ```
- e.g. `rosrun turtlesim turtlesim_node __name:=my_turtle`

## 3. launch
### 3.1 check the usage with `roslaunch -h`
### 3.2 launch with gdb
Add launch-prefix="xterm -e gdb --args" under <node> tag.

## 4. rosbag
### 4.1 record all the topics, using
  ```
rosbag record -a
  ```
### 4.2 record the topics we interested in 
  ```
rosbag record -O subset /topic1/name /topic2/name
  ```
### 4.3 change the rate of publishing topics
  ```
rosbag play -r 2 <bagfile>
  ```
### 4.4 filtering rosbag files
  ```
rosbag filter raw_input.bag filtered_output.bag 'topic=="/topic1","/topic2","/topic3"'  
  ```
## 5. extract images from rosbag files
  ```
rosrun image_view extract_images _sec_per_frame:=0 _filename_format:="frame%04i.jpg"
  ```
- set _sec_per_frame to 0 to avoid missing any frames.  
  
  
  
## 6. rostest
- run test for specific package
  ```
  catkin_make run_tests -DCATKIN_WHITELIST_PACKAGES="package_name"
  ```

# TF related
Using ros bag to publish TF, but remove a specific frame in that tf.[here](tf_filter.txt)
