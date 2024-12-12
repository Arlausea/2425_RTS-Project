#!bin/sh

# Expected NAME in argument of this script

NAME=$1

ssh root@$LAN_IP
scp config.sh /tmp/
scp configWifi.sh /tmp/
./config.sh $NAME
./configWifi.sh $NAME

echo "


