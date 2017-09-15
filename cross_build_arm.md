## Prepare sysroot
TODO

## Create and setup docker container for cross build
- create docker container
```sh
docker run --name rpi-cross-build -d ubuntu:14.04 tail -f /dev/null
docker exec -it rpi-cross-build bash
```

- setup user, ssh server and repo in docker container
```sh
adduser hope  #and follow on screen instruction to key in password
apt-get update
apt-get install -y openssh-server build-essential nano cmake git pkg-config
service ssh start
nano /etc/sudoers   # and add hope  ALL=(ALL:ALL) ALL under the line 'root  ALL(ALL:ALL) ALL'
```

- copy sysroot, cmake toolchain file and cross compiler over
```sh
docker cp gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf rpi-cross-build:/home/hope/
docker cp piroot rpi-cross-build:/home/hope/
docker cp rostoolchain.cmake rpi-cross-build:/home/hope/
```

- ssh into the docker container and install ros
```sh
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install -y python-catkin-pkg
```

## Build preparation
- prepare the build directories
```sh
mkdir -pv catkin_ws/src
source /home/hope/piroot/opt/ros/indigo/setup.bash
cd catkin_ws
git clone https://github.com/hopetechnik/ht_sesto_utils.git
git clone https://github.com/hopetechnik/sesto_smart_devices.git
```

- prepare for build
```sh
export PYTHONPATH=$PYTHONPATH:/home/hope/piroot/usr/lib/python2.7/dist-packages   # so that it can find catkin_pkg
```

- Do some hacky library soft link
```sh
sudo ln -s /home/hope/piroot/usr/lib/arm-linux-gnueabihf /usr/lib/arm-linux-gnueabihf
sudo ln -s /home/hope/piroot/usr/lib/arm-linux-gnueabihf/liblog4cxx.so /usr/lib/liblog4cxx.so
```

## Build
- Cross build
```sh
catkin_make install --cmake-args -DCMAKE_TOOLCHAIN_FILE=/home/hope/rostoolchain.cmake -DCMAKE_PREFIX_PATH=/home/hope/piroot/opt/ros/indigo -DCATKIN_BLACKLIST_PACKAGES="rpi_intelligent_system_xmlrpc"
sed -i "s/'\/home\/hope\/piroot\/opt\/ros\/indigo'/'\/opt\/ros\/indigo'/" _setup_util.py
```

