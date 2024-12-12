#!/bin/ash

# Turn an OpenWrt dumb access point into a Wi-fi mesh point

# use at your own risk !!!!
# backup your router first !!!!
# script expects factory settings+1st script to be executed!!!!
# the script might not run on all hardware !!!
# Expected NAME in argument of this script

#      A MODIFIER 5G ->AP et AP _XX
#      A MODIFIER 2.4G ->AP et MESH

# ######################
# you may customize this
# ######################

NAME=$1
ID=${NAME: -2}

PASSWORD="theseus-2023"

MESH_NAME="THESEUS"
MESH_PWD=$PASSWORD
MESH_RADIO=radio1
MESH_CHANNEL=1

MESH5_NAME="THESEUS"
MESH5_PWD=$PASSWORD
MESH5_RADIO=radio0
MESH5_CHANNEL=36


WIFI_NAME="RABBIT"
WIFI_PWD=$PASSWORD
WIFI_RADIO=radio1
WIFI_CHANNEL=10
WIFI_MOBDOMAIN='2222'

WIFI5_NAME="RABBIT_${ID}"
WIFI5_PWD=$PASSWORD
WIFI5_RADIO=radio0
WIFI5_CHANNEL=36
WIFI5_MOBDOMAIN='2222'


# delete the "OpenWrt" radios
uci delete wireless.default_radio0
uci delete wireless.default_radio1


# create the mesh Wifi
uci set wireless.wifinet0=wifi-iface
uci set wireless.wifinet0.device=$MESH_RADIO
uci set wireless.wifinet0.mode='mesh'
#uci set wireless.wifinet0.encryption='none'
uci set wireless.wifinet0.encryption='sae'
uci set wireless.wifinet0.key=$MESH_PWD
uci set wireless.wifinet0.mesh_id=$MESH_NAME
uci set wireless.wifinet0.mesh_fwding='1'
uci set wireless.wifinet0.mesh_rssi_threshold='0'
uci set wireless.wifinet0.network='lan'
uci set "wireless.$MESH_RADIO.channel"=$MESH_CHANNEL
uci delete "wireless.$MESH_RADIO.disabled"


# create the mesh Wifi
uci set wireless.wifinet3=wifi-iface
uci set wireless.wifinet3.device=$MESH5_RADIO
uci set wireless.wifinet3.mode='mesh'
#uci set wireless.wifinet3.encryption='none'
uci set wireless.wifinet3.encryption='sae'
uci set wireless.wifinet3.key=$MESH5_PWD
uci set wireless.wifinet3.mesh_id=$MESH5_NAME
uci set wireless.wifinet3.mesh_fwding='1'
uci set wireless.wifinet3.mesh_rssi_threshold='0'
uci set wireless.wifinet3.network='lan'
uci set "wireless.$MESH5_RADIO.channel"=$MESH5_CHANNEL
uci delete "wireless.$MESH5_RADIO.disabled"


# create the AP Wifi 2.4GHz
uci set wireless.wifinet1=wifi-iface
uci set wireless.wifinet1.device=$WIFI_RADIO
uci set wireless.wifinet1.mode='ap'
uci set wireless.wifinet1.ssid=$WIFI_NAME
#uci set wireless.wifinet1.encryption='none'
uci set wireless.wifinet1.encryption='sae-mixed'
uci set wireless.wifinet1.key=$WIFI_PWD
uci set wireless.wifinet1.ieee80211r='1'
uci set wireless.wifinet1.mobility_domain=$WIFI_MOBDOMAIN
uci set wireless.wifinet1.ft_over_ds='0'
uci set wireless.wifinet1.ft_psk_generate_local='1'
uci set wireless.wifinet1.network='lan'
uci set "wireless.$WIFI_RADIO.channel"=$WIFI_CHANNEL
uci delete "wireless.$WIFI_RADIO.disabled"


# create the AP Wifi 5GHz
uci set wireless.wifinet2=wifi-iface
uci set wireless.wifinet2.device=$WIFI5_RADIO
uci set wireless.wifinet2.mode='ap'
uci set wireless.wifinet2.ssid=$WIFI5_NAME
#uci set wireless.wifinet2.encryption='none'
uci set wireless.wifinet2.encryption='sae-mixed'
uci set wireless.wifinet2.key=$WIFI_PWD
uci set wireless.wifinet2.ieee80211r='1'
uci set wireless.wifinet2.mobility_domain=$WIFI5_MOBDOMAIN
uci set wireless.wifinet2.ft_over_ds='0'
uci set wireless.wifinet2.ft_psk_generate_local='1'
uci set wireless.wifinet2.network='lan'
uci set "wireless.$WIFI5_RADIO.channel"=$WIFI5_CHANNEL
uci delete "wireless.$WIFI5_RADIO.disabled"

uci commit

wifi down
/etc/init.d/wpad restart
wifi up

echo "
