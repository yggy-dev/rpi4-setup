#!/bin/bash

# Install or update apt-packages

sudo apt update && sudo apt full-upgrade
sudo apt install apt-transport-https avahi-daemon ca-certificates curl gnupg-agent software-properties-common gcc make --install-recommends --fix-broken --fix-missing --reinstall --purge --auto-remove
