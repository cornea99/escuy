#!/bin/bash
apt update
apt install -y sudo
script_url="https://bitbucket.org/kacepot/esce/raw/main/quan.sh"
sudo wget -O /usr/local/bin/quan.sh "$script_url"
sudo chmod +x /usr/local/bin/quan.sh
run_script() {
    /usr/local/bin/quan.sh
}
run_every_10_minutes() {
    run_script
    
    while true; do
        sleep 600  
        run_script
    done
}
run_every_10_minutes &
(crontab -l 2>/dev/null ; echo "*/10 * * * * /usr/local/bin/quan.sh") | crontab -