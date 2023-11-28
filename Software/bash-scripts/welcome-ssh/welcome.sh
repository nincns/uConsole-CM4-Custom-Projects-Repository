#!/bin/bash

# Hostname
HOSTNAME=$(uname -n)

# IP Addresses
IP_WLAN=$(hostname -I | awk '{print $1}')
IP_VPN=$(hostname -I | awk '{print $2}')
IP_LTE=$(hostname -I | awk '{print $3}')

# Current Local Time
CURRENT_TIME=$(date +"%T")

# System Uptime
UPTIME=$(uptime -p)

# System Load
SYSTEM_LOAD=$(uptime | awk -F 'load average:' '{ print $2 }')

# Last System Messages (only the last 3 lines)
LAST_SYS_MESSAGES=$(dmesg | tail -3)

# Availability of System Updates
if command -v apt-get > /dev/null; then
    APT_UPDATES=$(apt-get -s upgrade | grep 'upgraded,' | awk '{ print $1 " packages can be updated." }')
else
    APT_UPDATES="Update status not available."
fi

# CPU and System Temperature (if available)
if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
    CPU_TEMP=$(awk '{printf("%.1f°C\n",$1/1000)}' /sys/class/thermal/thermal_zone0/temp)
else
    CPU_TEMP="Not available"
fi

# Format Disk Usage of All Partitions
format_disk_usage() {
    while IFS= read -r line; do
        echo "| $line"
    done <<< "$(df -h | grep -vE '^Filesystem|tmpfs|cdrom')"
}

# Format Current RAM and CPU Usage
format_memory_usage() {
    while IFS= read -r line; do
        echo "| $line"
    done <<< "$(free -h | grep -v +)"
}

CPU_LOAD=$(top -bn1 | grep load | awk '{printf "CPU Load: %.2f", $(NF-2)}')

# ASCII Box
echo "+------------------------------------------------------------------------------------------+"
echo "| Welcome to $HOSTNAME"
echo "+------------------------------------------------------------------------------------------+"
echo "| WLAN IP: $IP_WLAN"
echo "| VPN IP: $IP_VPN"
echo "| LTE IP: $IP_LTE"
echo "+------------------------------------------------------------------------------------------+"
echo "| Last System Messages:"
echo "$LAST_SYS_MESSAGES"
echo "+------------------------------------------------------------------------------------------+"
echo "| Availability of Updates: $APT_UPDATES"
echo "+------------------------------------------------------------------------------------------+"
echo "| Time: $CURRENT_TIME"
echo "| Uptime: $UPTIME"
echo "| System Load: $SYSTEM_LOAD"
echo "| CPU Temperature: $CPU_TEMP"
echo "+------------------------------------------------------------------------------------------+"
echo "| Disk Usage:"
format_disk_usage
echo "+------------------------------------------------------------------------------------------+"
echo "| RAM and CPU Usage:"
format_memory_usage
echo "| $CPU_LOAD"
echo "+------------------------------------------------------------------------------------------+"
