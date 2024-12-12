#!bin/sh

# Expected NAME and LAN_IP in argument of this script

NAME=$1
LAN_IP=$2

ssh root@$LAN_IP
scp config.sh
scp configWifi.sh
./config.sh $NAME $LAN_IP
./configWifi.sh $NAME $LAN_IP



