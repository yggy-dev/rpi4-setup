#!/bin/bash

### Install or update packages
sudo apt update && sudo apt full-upgrade
sudo apt install apt-transport-https avahi-daemon ca-certificates curl gnupg-agent software-properties-common

### Install and setup neofetch
sudo apt install neofetch
sudo cp motd.sh /etc/profile.d/motd.sh
sudo chmod +x /etc/profile.d/motd.sh

### Passwordless sudo
sudo echo 'ubuntu ALL=(ALL) PASSWD: ALL' > /etc/sudoers.d/010_pi-nopasswd

### REPLACE /boot.conf with ../configs/boot.conf ###
sudo sed -i 's/#dtparam=i2c_arm=on/dtparam=i2c_arm=on/g' /boot.conf
sudo sed -i '/dtparam=i2c_arm=on/a\dtparam=i2c_arm_baudrate=400000' /boot.conf
sudo sed -i '/#dtparam=spi=on/a\dtoverlay=gpio-shutdown,gpio_pin=4,active_low=1,gpio_pull=up' /boot.conf

### ENABLE i2c IN FIRMWARE ###
sudo sed -i 's/#dtparam=i2c_arm=on/dtparam=i2c_arm=on/g' /boot/firmware/config.txt

### RASPI ENABLE i2c ###
sudo raspi-config nonint do_i2c 0

### ADD i2c TO /etc/modules ###
sudo echo "i2c-dev" | sudo tee -a /etc/modules >/dev/null

### MAKE SKU_RM0004 ###
git clone https://github.com/UCTRONICS/SKU_RM0004.git
cd SKU_RM0004
make clean
make

### MOVE display TO /usr/local/bin ###
sudo cp display /usr/local/bin

### REMOVE SKU_RM0004 ###
cd ..
sudo rm -rf SKU_RM0004

### ADD TO /etc/rc.local ###
sudo sed -i '/exit 0/i\/usr/local/bin/display &' /etc/rc.local
### OR
sudo cp lcd_display.service /usr/lib/systemd/system/lcd_display.service
cd /usr/lib/systemd/system/
sudo chmod +x lcd_display.service
sudo systemctl daemon-reload
sudo systemctl start lcd_display
sudo systemctl enable lcd_display

### REBOOT ###
sudo reboot