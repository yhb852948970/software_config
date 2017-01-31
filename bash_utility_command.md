# Bash utility commands
1. restart network
  ```
sudo service network-manager restart
  ```

2. check Ubuntu kernel version distribution 
  ```
lsb_release -a
uname -r
  ```
  
3. using GUI with sudo permission
  ```
gksu nautilus
sudo -i nautilus
  ```

4. find command
  ```  
find [path] [expression]
find /home/haibo -name filename
find ~/catkin_ws/src -name "*.cpp"  
  ```

5. grep command <br />
  - Using grep with *-w* option to match the exact word. <br />
  - Using grep with *-i* option to case insensitive. <br />

6. file command <br />

7. diff command to compare two files <br />
  ```
  diff -u file1 file2
  ```
  
8. head / tail command <br />
  ```
  head -5 file1
  ```
  
9. touch command <br />
Using touch command to create a new file.

10. create a soft link <br />
  ```
  ln -s src dst
  ```

11. cat command for redirection <br />
  - create a new file, `cat > filename`
  - append to an existing file,`cat >> filename`

12. tee command to send outputs in two directions
  ```
  echo "This is a test. " | tee file1 -a
  ```
the *-a* option is used to append to the file instead of rewrite the file. <br /> 
