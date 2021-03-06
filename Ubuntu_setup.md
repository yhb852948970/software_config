Ubuntu setup for new installation
=================================

## install packages
### 1. Packages to insatll <br />

  - must install
```
sudo apt-get install synaptic ssh gdebi inxi build-essential cmake-qt-gui libboost-all-dev libxine-dev  nautilus-open-terminal terminator chromium-browser git filezilla gimp gparted htop
```

  - optional to install
``` 
sudo apt-get install eclipse-cqt libxmlrpc-c++8-dev minicom
```
  - other packages need to be installed by download.
  1. angry ip scanner <br />
  2. CLion <br />
  change the line in .desktop file in ~/.local/share/application to "Exec=bash -i -c "/opt/clion-2017.1.3/bin/clion.sh" %f" 
  
### 2. after install terminator, using this command to set default terminal 
```bash
sudo update-alternatives --config x-terminal-emulator
```

### 3. In the software center, install "Ubuntu restricted extras", "VLC", "SMPlayer", "Audacious". <br /> 

### 4. Optional to install "WPS" and then the support fonts, "wps-office-fonts".

### 5. Optional to install "Texmaker" in the software center and additional fonts by
```bash
sudo apt-get install texlive-fonts-recommended
```

### 6. To isntall googel pinyin
```bash
sudo apt-get install fcitx-googlepinyin
im-config
```

### 8. Stop error reporting
```bash
gksudo gedit /etc/default/apport
```
change to *enabled=0*

### 10. install gtest
```bash
sudo apt-get install libgtest-dev
```
This package only install source files and we need to compile by ourselves. <br />
  
  ```
  cd /usr/src/gtest
  sudo cmake .
  sudo make
  sudo cp *.a /usr/lib
  ```
### 11. install oracle-java
The zip file can be find [here](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html).
The installation guide can be find from [here](http://www.wikihow.com/Install-Oracle-Java-on-Ubuntu-Linux).


## Useful softwares
### 1. simple photo editing, "Shotwell photo manage" (already installed) <br />


# GPU related 
### 1. Install NVIDIA drivers
  ```
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo add-apt-repository --remove ppa:xorg-edgers/ppa
sudo add-apt-repository --remove ppa:mamarley/nvidia
sudo apt-get install nvidia-367 nvidia-settings
  ```

### 2. Switch to NVIDIA 
  ```
prime-select nvidia
  ```

### 3. check the version of NVIDIA driver
  ```
nvidia-smi
  ```

# ~/.bashrc
```
# CUDA
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export CUDA_HOME=/usr/local/cuda

# OpenCV
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opencv-2.4.13/lib/pkgconfig
export PKG_CONFIG_PATH
```
