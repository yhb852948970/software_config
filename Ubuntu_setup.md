Ubuntu setup for new installation
=================================

## install packages
### 1. Packages to insatll <br />

  - must install
```
sudo apt-get install synaptic ssh gdebi inxi build-essential cmake-qt-gui libboost-all-dev libxine-dev  nautilus-open-terminal terminator chromium-browser
```

  - optional to install
``` 
sudo apt-get install eclipse-cqt gimp
```
### 2. after install terminator, using this command to set default terminal 
```bash
gsettings set org.gnome.desktop.default-applications.terminal exec 'x-terminal-emulator'
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
  
### 7. Setup nano editor
  ```
  cat ~/.nanorc
  include /usr/share/nano/sh.nanorc 
  include /usr/share/nano/c.nanorc 
  include /usr/share/nano/xml.nanorc 
  include /usr/share/nano/cmake.nanorc 
  include /usr/share/nano/python.nanorc 
  ```
### 8. Stop error reporting
```bash
gksudo gedit /etc/default/apport
```
change to *enabled=0*

### 9. config editor <br />
e.g. *gedit* and *atom*

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

