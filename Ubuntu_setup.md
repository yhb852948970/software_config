# Ubuntu setup for new installation

## install packages
1. Packages must to insatll <br />
  ```
sudo apt-get install synaptic ssh gdebi inxi build-essential cmake-qt-gui libboost-all-dev libxine-dev eclipse-cqt nautilus-open-terminal gimp
 ```

2. In the software center, install "Ubuntu restricted extras", "VLC", "SMPlayer", "Audacious". <br /> 

3. Optional to install "WPS" and then the support fonts, "wps-office-fonts".

4. Optional to install "Texmaker" in the software center and additional fonts by
  ```
sudo apt-get install texlive-fonts-recommended
  ```

5. Optional to isntall googel pinyi
  ```
sudo apt-get install fcitx-googlepinyin
im-config
  ```
  
6. Setup nano editor
  ```
  cat ~/.nanorc
  include /usr/share/nano/sh.nanorc 
  include /usr/share/nano/c.nanorc 
  include /usr/share/nano/xml.nanorc 
  include /usr/share/nano/cmake.nanorc 
  include /usr/share/nano/python.nanorc 
  ```
7. Stop error reporting

  ```
  gksudo gedit /etc/default/apport
  ```
change to *enabled=0*

8. setup editor
e.g. *gedit* and *atom*

## Useful softwares
1. simple photo editing, "Shotwell photo manage" (already installed) <br />


## GPU related 
1. Install NVIDIA drivers
  ```
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo add-apt-repository --remove ppa:xorg-edgers/ppa
sudo add-apt-repository --remove ppa:mamarley/nvidia
sudo apt-get install nvidia-367 nvidia-settings
  ```

2. Switch to NVIDIA 
  ```
prime-select nvidia
  ```

3. check the version of NVIDIA driver
  ```
nvidia-smi
  ```
  
  
## Others

ln -s src dst

ldd // check the .so

echo $?	// output the return/exit value
