#!/bin/bash

# Disconnect from VPNs
clear
if ip a | grep -q 'VPN-Home'; then
	systemctl stop wg-quick@VPN-Home.service
	echo "VPN-Home Disconnected"
	exit

elif ip a | grep -q 'VPN-Cloud'; then
	systemctl stop  wg-quick@VPN-Cloud.service
	echo "VPN-Cloud Disconnected"
	exit
fi

#Connect to VPNs
clear
echo "Connect to a VPN?"
echo "1: VPN-Home"
echo "2: VPN-Cloud"
read vpnchoice

if [ $vpnchoice = "1" ]; then
	systemctl start wg-quick@VPN-Home.service
	echo "VPN-Home Connected"

elif [ $vpnchoice = "2" ]; then
	systemctl start wg-quick@VPN-Cloud.service
	echo "VPN-Cloud Connected"
	exit
fi
