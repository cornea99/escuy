#!/bin/bash
apt update
apt install sudo -y
git clone https://github.com/cornea99/browserless-python.git
cd browserless-python
sudo bash install.sh
bash install.sh
