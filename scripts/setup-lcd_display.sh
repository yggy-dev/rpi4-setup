#!/bin/bash

# MAKE SKU_RM0004
git clone https://github.com/UCTRONICS/SKU_RM0004.git
cd SKU_RM0004
make clean
make

# MOVE display TO /usr/local/bin
sudo cp display /usr/local/bin

# REMOVE SKU_RM0004
cd ..
sudo rm -rf SKU_RM0004


# ADD TO /etc/rc.local
# sudo sed -i '/exit 0/i\/usr/local/bin/display &' /etc/rc.local
# OR TO /usr/lib/systemd/system/
sudo cp ./lcd_display.service /usr/lib/systemd/system/lcd_display.service
cd /usr/lib/systemd/system/
sudo chmod +x lcd_display.service
sudo systemctl daemon-reload
sudo systemctl start lcd_display
sudo systemctl enable lcd_display