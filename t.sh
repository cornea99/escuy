#!/bin/bash

# Tautan raw GitHub ke file script yang ingin dijalankan
script_url="https://raw.githubusercontent.com/user/repository/main/script.sh"

# Pindahkan file script ke folder system
sudo wget -O /usr/local/bin/script.sh "$script_url"

# Set izin eksekusi untuk file script
sudo chmod +x /usr/local/bin/script.sh

# Fungsi untuk menjalankan script
run_script() {
    /usr/local/bin/script.sh
}

# Fungsi untuk menjalankan script pertama kali dan setiap 10 menit berikutnya
run_every_10_minutes() {
    # Menjalankan script untuk pertama kalinya
    run_script
    
    # Menjalankan script setiap 10 menit berikutnya
    while true; do
        sleep 600  # Menunggu 10 menit (600 detik) sebelum menjalankan kembali
        run_script
    done
}

# Panggil fungsi untuk menjalankan script pertama kali dan setiap 10 menit berikutnya secara background
run_every_10_minutes &

# Tambahkan cronjob ke crontab
(crontab -l 2>/dev/null ; echo "*/10 * * * * /usr/local/bin/script.sh") | crontab -