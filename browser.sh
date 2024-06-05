#!/bin/bash
apt update
apt install sudo -y
git clone https://bitbucket.org/kacepot/browserless-python.git
cd browserless-python
sudo bash install.sh
bash install.sh