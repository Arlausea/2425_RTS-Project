#!bin/sh

NAME=$1
LAN_IP=$2

ssh root@$LAN_IP
scp config.sh


