#!/bin/bash

sudo bash ./scripts/setup-apt.sh
sudo bash ./scripts/setup-neofetch.sh
sudo bash ./scripts/setup-boot.sh
sudo bash ./scripts/setup-lcd_display.sh

### Passwordless sudo
# sudo echo 'ubuntu ALL=(ALL) PASSWD: ALL' > /etc/sudoers.d/010_pi-nopasswd


### REBOOT ###
sudo reboot