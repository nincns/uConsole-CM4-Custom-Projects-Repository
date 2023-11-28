#!/bin/bash

# Activate the 4G module
echo "Activating 4G module..."
sudo uconsole-4g-cm4 enable

# Wait a moment to ensure the modem is ready
sleep 10

# Restart the ModemManager service
echo "Restarting ModemManager..."
sudo systemctl restart ModemManager

# Wait a moment for the service to restart
sleep 5

# Check if the modem is recognized
echo "Checking if the modem is recognized..."
mmcli -L

# Try to activate the 4gnet connection
echo "Attempting to activate the 4G network connection..."
sudo nmcli c up 4gnet

# Check if the ppp0 interface exists and is active
if ifconfig | grep -q "ppp0"; then
    echo "The 4G modem is connected and active."
else
    echo "The 4G modem is not active. Creating and activating the 4G network connection..."
    # Create and activate the connection
    sudo nmcli c add type gsm ifname ttyUSB2 con-name 4gnet apn internet.t-mobile
    sudo nmcli c up 4gnet
fi

# Done
echo "4G modem setup completed."
