#!bin/sh

# Expected NAME in argument of this script

NAME=$1
LAN_IP=$2

scp /doc/config.sh root@$LAN_IP:/tmp/
ssh root@$LAN_IP
PASSWD
chmod +x /tmp/config.sh
/tmp/config.sh $NAME

echo "


