Bash utility commands
=====================

### 1. restart network
  ```
sudo service network-manager restart
  ```
  
### 3. using GUI with sudo permission
  ```
gksu nautilus
sudo -i nautilus
  ```


### 5. grep command 
```bash
grep string_to_match filename
grep -RHn "string_to_match"
```
  - Using *-w* option to match the exact word. 
  - Using *-H* to show to file name of a match
  - Using *-R* to search in the sub-folder recursively

### 6. diff command to compare two files 
  ```bash
diff -u file1 file2
  ```


### 10. tee command to send outputs in two directions
  ```bash
echo "This is a test. " | tee file1 -a
  ```
the *-a* option is used to append to the file instead of rewrite the file. <br /> 

### 12. output the return/exit value
  ```bash
  echo $?
  ```

### 13. redirect terminal output to a file
  ```bash
  command >> file.txt 2>&1
  ```
### 14. using sudo without password
  ```bash
  sudo visudo
  ```
Add "USERNAME ALL=NOPASSWD: ALL"  

### 15. add desktop/launch icon for an application
/usr/share/applications/firefox.desktop

### 17. set up networks
```bash
sudo ifdown wlan0
sudo ifup eth0
sudo ifconfig eth0 up
sudo dhclient eth0
```

```bash
sudo nano /etc/network/interfaces
```
Add the follwing contents to this file

auto eth0
iface eth0 inet static
address 192.168.88.x
netmask 255.255.255.0
#gateway 192.168.88.20

auto wlan0
iface wlan0 inet dhcp
wpa-ssid HOPE4G+
wpa-psk 123456abcd


# 2.0 APT related command
## 1. check package info by apt-cache
```bash
sudo apt-cache depends <package> # check dependencies of a package
apt-cache pkgnames # print all the install package names
```
## 2. apt-get 
```bash
sudo apt-get -d install <package> # download deb to /var/cache/apt/archives without installation
sudo apt-get autoclean # delete partially downloaded packages, or packages no longer installed
sudo apt-get clean # Removes all cached packages from/var/cache/apt/archives to free up disk space
sudo apt-get -f install #Do a sanity check for broken packages. This tries to fix any “unmet dependency” messages.
```
# 3.0 Using systemd to create upstart job
1. create a [foo.service](foo.service) file


2. put the foo.service file into /etc/systemd/system

3. enable the service by
```bash
systemctl daemon-reload
systemctl enable agvui.service
```
