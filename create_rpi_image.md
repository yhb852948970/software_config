# Create Raspbian Jessie Lite Based SD Card Image

This document explains how to create a Raspbian Jessie Lite Based SD card image which is ready to write into SD card (larger than 4GB). This document assumes you have a working Linux PC (Preferrably Ubuntu)

## Preparation
Install ddrescue using
```sh
sudo apt-get install gddrescue
```

## Download Raspbian and Install
Download Raspbian Jessie Lite image from [here](https://www.raspberrypi.org/downloads/raspbian/). At the time of editing this document, the version is May 2016 (Released on 2016-05-27)

Write the Raspbian image into SD card with the following command, assuming you are in the directory containing the downloaded Raspbian image and the SD card is at /dev/mmcblk0
```sh
sudo ddrescue -D --force 2016-05-27-raspbian-jessie-lite.img /dev/mmcblk0
```
To confirm the image has been completely written:
```sh
sudo sync
```
and remove the SD card from your PC/Laptop. Plug it into a Raspberry Pi and start it up.

## Setup

The default login for Raspbian is user 'pi' and password 'raspberry'

#### Create user 'hope'
```sh
sudo adduser hope
```
enter and re-type the user's password when prompted. Can use the default for rest of user's information (Full name and etc)

Create a directory for storing user AGVUI settings
```sh
mkdir -pv /home/hope/.config/HopeTechnik
```

### Add user 'hope' to sudoers
To enable user 'hope' have sudo right, edit */etc/sudoers* and add **hope    ALL=(ALL:ALL) ALL** under the line of **root    ALL=(ALL:ALL) ALL**

### Add user 'hope' to groups
Add user hope to video and input groups with command

```sh
sudo usermod -aG video hope
sudo usermod -aG input hope
```

### Enable ssh server
In terminal

```sh
sudo systemctl enable ssh
```

### Install required packages

Make sure you have internet connection. Install required packages using: 

```sh
sudo apt-get update
sudo apt-get install rsync fontconfig
```

### Install ROS Indigo

```sh
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt-get update

sudo apt-get install ros-indigo-ros-base
```

### Remove some unneeded display

Edit */boot/config.txt* and add following 2 lines at the end of the file

```sh
disable_splash=1
avoid_warnings=1
```

Edit */boot/cmdline.txt* and add ```logo.nologo``` to the end of the line

### Manual IP address and hostname

Edit */etc/network/interfaces* and replace ```iface eth0 inet manual``` with:

```sh
auto eth0
iface eth0 inet static
address 192.168.88.70
netmask 255.255.255.0
```

Create file */etc/udev/rules.d/70-persistent-net.rules* and input the following as content

```sh
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="b8:27:eb:6c:0f:a0", NAME="eth0"
```

*Note: during deployment, the mac address field in this file need to be replaced with the mac address of deployed raspberry pi*

Edit */etc/hostname* and replace ```raspberrypi``` with ```sestoagvui```

Edit */etc/hosts* and replace ```127.0.1.1    raspberrypi``` with ```127.0.1.1    sestoagvui```

## Creating Image

Copy the SD card content into image using

```sh
sudo dd if=/dev/mmcblk0 of=rspbui.img bs=4M
```

### Shrink the SD card image

Before proceed, make sure you have GParted install

Create loopback device using the following command, the original guide can be found [here](http://softwarebakery.com/shrinking-images-on-linux)

```sh
sudo modprobe loop
sudo losetup -f
sudo losetup /dev/loop0 rspbui.img
sudo partprobe /dev/loop0
```

Then, edit the partition using gparted

```sh
sudo gparted /dev/loop0
```

Shrink the */dev/loop0p2* to ~3.5GB and exit gparted. Unload the loopback device using:

```sh
sudo losetup -d /dev/loop0
```

Shrink the image using:

```sh
sudo truncate --size=$[(7305215+1)*512] rspbui.img
```
The size of the the image (7305215 in this case) can be obtained from:

```sh
sudo fdisk -l rspbui.img
```

and get the End of the last partition.

Now you should have a 3.5GB rspbui.img
