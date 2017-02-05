#! /usr/bin/cmake

### This is a general CMakeLists template for simple projects ###
### Author: Haibo YU ###
### Data: 21-Apr-2016 ###

# Specify the minimum version for CMake
cmake_minimum_required(VERSION 2.8)

# Project's name
project( Tutorial )

MESSAGE( "This a simple cmake tutorial for beginners." )

# The version number
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

# Set the output folder where your porgram will be created
SET(CMAKE_CXX_COMPILER "g++")
SET(CMAKE_BUILD_TYPE Debug  )
set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/bin)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR})

# configure a header file to pass some of the CMake settings to the source code
configure_file (
	"${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
	"${PROJECT_BINARY_DIR}/TutorialConfig.h"	
)

# include path for searching header file
include_directories("${PROJECT_SOURCE_DIR}")
include_directories("${PROJECT_SOURCE_DIR}/include")
include_directories(${OpenCV_INCLUDE_DIRS})
include_directories(${CUDA_INCLUDE_DIRS})

add_subdirectory (sub_folder)

#ADD_DEFINITIONS(-DBOOST_THREAD_USE_LIB=ON)

#### There is a list of CMakes's global variables. e.g.
	# CMAKE_SOURCE_DIR
	### this is the directory, from which cmake was started, i.e. the top level source directory
	# CMAKE_BINARY_DIR
	### if you are building in-source, this is the same as CMAKE_SOURCE_DIR, otherwise this is the top level directory of your build tree
	# EXECUTABLE_OUTPUT_PATH
	### set this variable to specify a common place where CMake should put all executable files

set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

# CMake Modules
find_package( OpenCV 2.4 REQUIRED )
#find_package(OpenCV 2.4 COMPONENTS core highgui imgproc REQUIRED)
## If opencv is not installed in the default directory
# cmake .. -DCMAKE_PREFIX_PATH='/home/chris/opencv-2.4.11/release/installed/share/OpenCV'


# compile the cpp file to an executable file
add_executable( Tutorial tutorial.cpp )

# compile the cpp file into a lib or dll file
add_library(MathFunctions mysqrt.cpp)

# link the excutable with libraries
target_link_libraries( Tutorial MathFunctions )
link_directories(${ZED_LIBRARY_DIR})

## The below code should be written in the configuration file instead here
## The contents between the @@ are the value set in this CMakeLists file and will be passed to the header file

#define Tutorial_VERSION_MAJOR @Tutorial_VERSION_MAJOR@
#define Tutorial_VERSION_MINOR @Tutorial_VERSION_MINOR@


### cmake variables
${PROJECT_NAME} # the name of the project set by project() command
${PROJECT_SOURCE_DIR} # contains the full path to the root of your project source directory, i.e. the nearest directory where CMakeLists.txt contains the project() command.
${CMAKE_INSTALL_PREFIX}

${VAR}
$ENV{VAR}

#catkin camke variables
$(find ROS-PACK-NAME)

# add the install targets 
install (TARGETS Tutorial DESTINATION bin) 
install (FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h"         
         DESTINATION include)





# EXECUTABLE
add_definitions(-std=c++11)# -m64) #-Wall)
#add_definitions(-std=c++0x)# -m64) #-Wall)

target_link_libraries(
        zed_wrapper_node
        ${catkin_LIBRARIES}
	${CUDA_LIBRARIES} ${CUDA_nppi_LIBRARY} ${CUDA_npps_LIBRARY}
        ${OpenCV_LIBS}
        ${PCL_LIBRARIES}
	${Boost_LIBRARIES}
    )

add_subdirectory (dir1)
include (file1.cmake)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -std=c++11")
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -O3" ) # Release Perf mode 


file(GLOB variable [RELATIVE path] [globbing expressions]...)
#FILE(GLOB_RECURSE SRC_FILES "${SRC_FOLDER}/*.cpp")

#set_property(TARGET ${execName} PROPERTY OUTPUT_NAME "ZED SVO Converter")

#### ZED ros wrapper #####

generate_dynamic_reconfigure_options(
  cfg/Zed.cfg
)
add_dependencies(zed_wrapper_node ${PROJECT_NAME}_gencfg)

#Add all files in subdirectories of the project in
# a dummy_target so qtcreator have access to all files
FILE(GLOB_RECURSE extra_files ${CMAKE_SOURCE_DIR}/*)
add_custom_target(dummy_${PROJECT_NAME} SOURCES ${extra_files})


find_package(Boost 1.5 COMPONENTS program_options REQUIRED)
find_package(CUDA 6.5 REQUIRED)
find_package(CUDA 6.5 EXACT REQUIRED)


include_directories(${CUDA_INCLUDE_DIRS})
include_directories(${OpenCV_INCLUDE_DIRS})
include_directories(${Boost_INCLUDE_DIRS})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

link_directories(${CUDA_LIBRARY_DIRS})
link_directories(${OpenCV_LIBRARY_DIRS})
link_directories(${Boost_LIBRARY_DIRS})



###### CMAKE for CUDA ######
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

############################### cmake sample #################################
option( DEBUG_ACTIVE "Enable Debug build" OFF )

if(DEBUG_ACTIVE)
    MESSAGE( "Debug compilation active" )
    set(ROS_BUILD_TYPE Debug)
    set(CMAKE_BUILD_TYPE Debug)
else()
    MESSAGE( "Release compilation active" )
    set(ROS_BUILD_TYPE Release)
    set(CMAKE_BUILD_TYPE Release)
endif()

if(COMMAND cmake_policy)
        cmake_policy(SET CMP0003 OLD)
        cmake_policy(SET CMP0015 OLD)
endif(COMMAND cmake_policy)

if(NOT DEBUG_ACTIVE)
    MESSAGE("Release optimizations active")
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -O3" ) # Release Perf mode
endif()
################################################################################

