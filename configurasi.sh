#!/bin/bash

# Tambah Swap Space
add_swap() {
    echo "Adding 2G swap space..."
    sudo fallocate -l 2G /swapfile
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile
    echo "/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab
    echo "Swap space added."
}

# Tingkatkan Batasan ulimit
increase_ulimit() {
    echo "Increasing file descriptor limits..."
    echo "fs.file-max = 100000" | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p
    echo "* soft nofile 4096" | sudo tee -a /etc/security/limits.conf
    echo "* hard nofile 4096" | sudo tee -a /etc/security/limits.conf
    echo "File descriptor limits increased."
}

# Konfigurasi Logging dan Audit
configure_audit() {
    echo "Configuring audit for kill command..."
    sudo apt-get install -y auditd
    sudo auditctl -w /usr/bin/kill -p x -k kill_logs
    echo "Audit configured."
}

# Konfigurasi cgroups (Contoh)
configure_cgroups() {
    echo "Configuring cgroups (if applicable)..."
    # Tambahkan konfigurasi cgroups spesifik di sini
    echo "cgroups configuration done."
}

# Konfigurasi systemd (Contoh)
configure_systemd() {
    echo "Configuring systemd service limits..."
    SERVICE_NAME="sgr1"
    sudo systemctl edit $SERVICE_NAME <<EOF
[Service]
LimitNOFILE=4096
EOF
    sudo systemctl daemon-reload
    echo "Systemd service limits configured."
}

# Aktifkan dan Konfigurasi Core Dumps
enable_core_dumps() {
    echo "Enabling core dumps..."
    echo "kernel.core_pattern=/var/lib/systemd/coredump/core.%e.%p.%h.%t" | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p
    echo "ulimit -c unlimited" | sudo tee -a /etc/profile
    echo "Core dumps enabled."
}

# Menangani Sinyal dalam Aplikasi (Contoh)
handle_signals() {
    echo "Adding signal handler example in Python..."
    cat <<EOF > signal_handler_example.py
import signal
import sys

def signal_handler(sig, frame):
    print('Gracefully exiting...')
    sys.exit(0)

signal.signal(signal.SIGTERM, signal_handler)

# Simulate a long-running process
while True:
    pass
EOF
    echo "Signal handler example added as signal_handler_example.py."
}

# Menjalankan semua fungsi
main() {
    add_swap
    increase_ulimit
    configure_audit
    configure_cgroups
    configure_systemd
    enable_core_dumps
    handle_signals
    echo "All configurations applied."
}

main
