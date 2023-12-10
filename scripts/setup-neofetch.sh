#!/bin/bash

# Install and setup neofetch

set -euo pipefail

sudo apt install neofetch
sudo cp ./scripts/motd.sh /etc/profile.d/motd.sh
sudo chmod +x /etc/profile.d/motd.sh