# Welcome Script for uConsole CM4

## Overview
`welcome.sh` is a Bash script designed to provide a quick overview of the system status on the uConsole CM4. It displays vital information such as IP addresses, system uptime, load, CPU temperature, memory and disk usage, and available system updates. This script is useful for users who want a quick summary of their system's status upon login or at a glance.

## Features
- Displays hostname and various IP addresses (WLAN, VPN, LTE).
- Shows current local time and system uptime.
- Reports system load and CPU temperature (if available).
- Lists the last few system messages for quick troubleshooting.
- Checks for available system updates (if `apt-get` is available).
- Displays formatted disk usage of all partitions.
- Shows current RAM and CPU usage in an easy-to-read format.

## Prerequisites
- The script is intended for use on the uConsole CM4, but can be adapted for other Linux systems.
- Requires standard utilities: `awk`, `date`, `uptime`, `dmesg`, `df`, `free`, `top`.
- For system updates check, `apt-get` should be available (Debian-based systems).

## Usage
1. Place the `welcome.sh` script in a suitable directory, such as `~/scripts`.
2. Give the script execute permissions:
   ```bash
   chmod +x ~/scripts/welcome.sh
   ```
3. Run the script manually by navigating to the directory and executing:
   ```bash
   ./welcome.sh
   ```
4. Optionally, you can add the script to your `.bashrc` or `.bash_profile` to run automatically on login:
   ```bash
   echo "~/scripts/welcome.sh" >> ~/.bashrc
   ```

## Customization
Feel free to modify the script to add more features or adapt it to your specific needs. 