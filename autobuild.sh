#!/bin/bash

server_name_ip="$1"
login_name="$2"
login_password="$3"
iso_url="$4"

# Login to remote server
echo "Login to remote server: $server_name_ip " 
ilorest login $server_name_ip -u $login_name -p $login_password

# Clear Controller Configuration
echo "Clear Controller Configuration"
ilorest clearcontrollerconfig --controller=1

# Create a new logical drive now
echo "Create a new logical drive now in Raid1"
ilorest createlogicaldrive customdrive Raid1 1,2 --controller=1 --name=myLogicaldrive --capacityGiB=-1 --accelerator-type=ControllerCache
ilorest reboot

# Wait for 5 mins
date
echo "Rebooting......, Waiting for 300 seconds here......"
sleep 300

# Now wake up
date
echo "Now wake up, Start to login in now....."

echo "Login to remote server: $server_name_ip 3rd time" 
ilorest login $server_name_ip -u $login_name -p $login_password

# Mount the virtual media
echo "Mount the virtual media from http://10.40.54.141/Autobuild/cc20-dl385g1-01.iso"
ilorest virtualmedia 2 $iso_url --bootnextreset

# Boot into the ISO image in the next reboot
echo "Booting into the ISO image now......"
ilorest reboot

echo "Rebooting now......, server should be booting into the ISO image"

exit 0
