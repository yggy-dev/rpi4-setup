#!/bin/bash

# REPLACE /boot.conf with ../configs/boot.conf

sudo sed -i 's/#dtparam=i2c_arm=on/dtparam=i2c_arm=on/g' ./boot.conf
sudo sed -i '/dtparam=i2c_arm=on/a\dtparam=i2c_arm_baudrate=400000' ./boot.conf
sudo sed -i '/#dtparam=spi=on/a\dtoverlay=gpio-shutdown,gpio_pin=4,active_low=1,gpio_pull=up' ./boot.conf

### ENABLE i2c IN FIRMWARE ###
sudo sed -i 's/#dtparam=i2c_arm=on/dtparam=i2c_arm=on/g' /boot/firmware/config.txt

### RASPI ENABLE i2c ###
sudo raspi-config nonint do_i2c 0

### ADD i2c TO /etc/modules ###
sudo echo "i2c-dev" | sudo tee -a /etc/modules >/dev/null