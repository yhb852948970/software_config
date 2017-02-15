#! /usr/bin/cmake

### This is a general CMakeLists template for simple projects ###
### Author: Haibo YU ###
### Data: 21-Apr-2016 ###

################ basic template ################
cmake_minimum_required(VERSION 2.8)

project( Tutorial )

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
SET(CMAKE_BUILD_TYPE Debug / Release  )

find_package()

include_directories()
link_directories()

add_library()
add_executable()
target_link_libraries( Tutorial MathFunctions )
#################################################


# other commands
MESSAGE( "This a simple cmake tutorial for beginners." )

option( DEBUG_ACTIVE "Enable Debug build" OFF )

SET(CMAKE_CXX_COMPILER "g++")
SET(CMAKE_BUILD_TYPE Debug / Release  )
set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/bin)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR})
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -std=c++11")
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -O3" ) # Release Perf mode 

# CMake Modules
find_package( OpenCV 2.4 REQUIRED )
#find_package(OpenCV 2.4 COMPONENTS core highgui imgproc REQUIRED)
## If opencv is not installed in the default directory
# cmake .. -DCMAKE_PREFIX_PATH='/home/chris/opencv-2.4.11/release/installed/share/OpenCV'

find_package(Boost 1.5 COMPONENTS program_options REQUIRED)
find_package(CUDA 6.5 REQUIRED)
find_package(CUDA 6.5 EXACT REQUIRED)


### cmake variables
${PROJECT_NAME} # the name of the project set by project() command
${PROJECT_SOURCE_DIR} # contains the full path to the root of your project source directory, i.e. the nearest directory where CMakeLists.txt contains the project() command.
${CMAKE_INSTALL_PREFIX} # /usr/local
${CMAKE_SOURCE_DIR} # top-level source dirctory of cmake
${CMAKE_CURRENT_SOURCE_DIR}

${VAR}
$ENV{VAR}

#catkin camke variables
$(find ROS-PACK-NAME)

# add the install targets 
install (TARGETS Tutorial 
          DESTINATION bin) 
install (FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h"         
          DESTINATION include)
install (DIRECTORY  launch/
          DESTINATION, ${MY_LAUNCH})
          
set_proterties
get_proterties

find_library(PROTOBUF_LIBRARY protobuf HINTS /usr/lib/x86_64-linux-gun)
target_link_library (test PUBLIC ${PROTOBUF_LIBRARY})

# EXECUTABLE
add_definitions(-std=c++11)# -m64) #-Wall)
ADD_DEFINITIONS(-DBOOST_THREAD_USE_LIB=ON)

add_subdirectory (dir1) # automaticly find the CMakeFiles.txt files in the dirs
include (file1.cmake) # re-use the exported cmake files

add_library(foo IMPORTED)
set_proterty(TARGET foo PROPERTY
              IMPORTED_LOCATION /path/to/lib)
              
add_dependencies(zed_wrapper_node ${PROJECT_NAME}_gencfg)


#Add all files in subdirectories of the project in
# a dummy_target so qtcreator have access to all files
FILE(GLOB_RECURSE extra_files ${CMAKE_SOURCE_DIR}/*)
add_custom_target(dummy_${PROJECT_NAME} SOURCES ${extra_files})

#################### CMAKE for CUDA #######################
find_package(CUDA 7.5 REQUIRED)
include_directories(${CUDA_INCLUDE_DIRS})
link_directories(${CUDA_LIBRARY_DIRS})

list(APPEND CUDA_NVCC_FLAGS -gencode arch=compute_20,code=sm_20)
list(APPEND CUDA_NVCC_FLAGS -gencode arch=compute_20,code=sm_21)
list(APPEND CUDA_NVCC_FLAGS -gencode arch=compute_30,code=sm_30)
list(APPEND CUDA_NVCC_FLAGS -gencode arch=compute_30,code=sm_35)
list(APPEND CUDA_NVCC_FLAGS -gencode arch=compute_50,code=sm_50)

set(CUDA_NVCC_FLAGS ${CUDA_NVCC_FLAGS} -std=c++11)
cuda_add_executable(${execName} ${SRC_FILES} ${SRC_CU_FOLDER})

TARGET_LINK_LIBRARIES(	${execName}
			${CUDA_LIBRARIES} 
			${CUDA_nppi_LIBRARY} 
			${CUDA_npps_LIBRARY}
			${Boost_LIBRARIES}
			)

