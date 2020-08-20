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
vpnchoice=$(whiptail --menu "Choose VPN to connect to:" 15 80 4 \
			"VPN-Home" "|  VPN server that allows access to the home network" \
			"VPN-Cloud" "|  VPN Server in the cloud with PiHole setup" 3>&1 1>&2 2>&3)

case $vpnchoice in 
	VPN-Home)
		systemctl start wg-quick@VPN-Home.service
		echo "VPN-Home Connected"
	;;
	VPN-Cloud)
		systemctl start wg-quick@VPN-Cloud.service
		echo "VPN-Cloud Connected"
	;;
esac