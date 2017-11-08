ifconfig wlp9s0 down
iwconfig wlp9s0 mode managed
ifconfig wlp9s0 up
iwconfig wlp9s0 | grep "Mode"

sleep 2

result=$(iwconfig wlp9s0 | grep "Mode" | cut -d: -f2,2)
echo $result
if [ "$result" == "Managed Access Point" ]
then
echo "The Mode is Set To Managed"
else
ifconfig wlp9s0 down
iwconfig wlp9s0 mode managed
ifconfig wlp9s0 up
iwconfig wlp9s0 | grep "Mode"
service network-manager restart
fi