#!/bin/bash

# gives a bit of time for the wifi to connect
sleep 20
# enable ssh
sudo systemctl enable ssh
# update and upgrade 
sudo apt-get update -y
sudo apt-get upgrade -y
# install programs
sudo apt-get install expect git zsh python3-pip python3-venv -y
# change default shell for root and pi users
sudo chsh -s /bin/zsh pi
sudo chsh -s /bin/zsh
# install ohmyzsh for root and pi users
sudo -u pi sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


# download Inky pHAT installer script
wget -qP /home/pi https://raw.githubusercontent.com/himalayanelixir/pi-inky-phat/master/inky-phat-installer.sh
# make executeable
chmod +x /home/pi/inky-phat-installer.sh
# run script
sh /home/pi/inky-phat-installer.sh


# tell pi to restart after one minute. This is needed for the ssh changes to work and for the adafruit screen drivers
sudo shutdown -r 1