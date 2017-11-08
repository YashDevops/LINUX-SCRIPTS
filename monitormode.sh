#!/bin/bash

ifconfig wlp9s0 down
iwconfig wlp9s0 mode monitor
ifconfig wlp9s0 up
iwconfig wlp9s0 | grep "Mode"

sleep 2

#recheck for the mode
#defval="Monitor  Frequency"
result=$(iwconfig wlp9s0 | grep "Mode" | cut -d: -f2,2)
if [ "$result" == "Monitor  Frequency" ]
then
echo "The Mode is Set To Monitor"
else
ifconfig wlp9s0 down
iwconfig wlp9s0 mode monitor
ifconfig wlp9s0 up
iwconfig wlp9s0 | grep "Mode"
fi
echo "Performing Check For Open Process"
airmon-ng check wlp9s0
echo "Clearing Your Process"
pkill NetworkManager
pkill wpa_supplicant
#check again for the avadhi-deamon process
echo "Checking for avadhi-deamon proccess id"
checkone=$(airmon-ng check wlp9s0)
echo $checkone
while [ "$checkone" == " " ]
do
	if [ "X"$checkone == "X" ]
	then	
	echo "checking ..... "
	airmon-ng check wlp9s0
	echo $?
	echo "Command Executed Succesfully"
	else
	airmon-ng check wlp9s0
	echo "Enter the process id"
	read checktwo
	kill $checktwo
	fi
done
echo "Starting Lookup"
airodump-ng wlp9s0

