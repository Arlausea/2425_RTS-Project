#!bin/sh

# Expected NAME and LAN_IP in argument of this script

NAME=$1
LAN_IP=$2

ssh root@$LAN_IP
scp config.sh /tmp/
scp configWifi.sh /tmp/
./config.sh $NAME
./configWifi.sh $NAME



