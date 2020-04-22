#!/bin/bash

# install font for display
pip3 install font_fredoka_one


# install drivers for Inky pHAT screen
wget https://get.pimoroni.com/inky -P /home/pi
# make downloaded script executable
chmod +x /home/pi/inky
# create script that uses expect to automate adafruit installation prompts
cat <<EOT >/home/pi/script.exp
#!/usr/bin/expect -f
set timeout -1
spawn ./inky
match_max 100000
expect -exact "Do you wish to continue? \[y/N\] "
send -- "y\r"
expect -exact "Do you wish to perform a full install? \[y/N\] "
send -- "N\r"
expect eof
EOT
# make script executable 
chmod +x /home/pi/script.exp
# run automation script which installs the adafruit screen drivers
chown pi /home/pi/script.exp
chown pi /home/pi/inky
su -c '/home/pi/script.exp' - pi
# remove the screen installation script
rm /home/pi/inky
# remove expect automation script
rm /home/pi/script.exp


# download the display program from github
wget -qP /home/pi https://raw.githubusercontent.com/himalayanelixir/pi-inky-phat/master/display.py
# make display program executable
sudo chmod +x /home/pi/display.py
# add display program to PATH
echo "export PATH=\"/home/pi:$PATH\"" >>/home/pi/.zshrc
# make pi user owner of the file we downloaded
chown pi /home/pi/display.py
# print success message
python3 /home/pi/display.py $(date +"%T")   