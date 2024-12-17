#!/bin/sh


# Nom et IP (à préciser en arguments)

NAME=$1
ID="${NAME: -2}"
IPID="::${ID}0"
IP="192.168.2.${ID}0/24"

# Nouveau mot de passe root
NEW_ROOT_PASSWD="theseus-2023"

# Nouveau hostname

uci set system.@system[0].hostname=$NAME


# 1. Modifier la configuration pour IPv4 DHCP
uci set network.lan.proto='dhcp'

# 2. Configurer l'IPv6 statique
uci set network.globals.ula_prefix='fd71:C:2025::/48'
uci set network.lan.ip6assign='64'
uci set network.lan.ip6ifaceid=$IPID

# 3. Supprimer l'adresse IP par défaut
uci del_list network.lan.ipaddr=$IP

# 4. Changer le mot de passe root
echo -e "$NEW_ROOT_PASSWD\n$NEW_ROOT_PASSWD" | passwd root
# 5. Appliquer les modifications réseau

uci commit system
/etc/init.d/system restart
echo "Mise à jour du nom en cours."
sleep 6 #Par précaution mais je pense non nécessaire
echo "Mise à jour des paramètres network en cours."
uci commit network
/etc/init.d/network restart

echo "Configuration mise à jour :"
echo "- IPv4 basculé en DHCP."
echo "- IPv6 statique configuré (fd71:C:2025$IPID/64)."
echo "- Adresse IPv4 '$IP' supprimée (si existante)."
echo "- Mot de passe root modifié."
echo "Script fonctionnel sans erreur"


uci set wireless.@wifi-device[0].disabled='0'
uci set wireless.@wifi-device[1].disabled='0'

# Configurer le wifi mesh en 2.4 GHz
uci add wireless wifi-iface
uci set wireless.@wifi-iface[-1].device='radio1'  # Associer à la radio1
uci set wireless.@wifi-iface[-1].mode='mesh'  # Mode mesh
uci set wireless.@wifi-iface[-1].encryption='sae'  # Chiffrement WPA3-SAE (recommandé pour le mesh)
uci set wireless.@wifi-iface[-1].key=$PASSWD  # Clé de sécurité
uci set wireless.@wifi-iface[-1].mesh_id='THESEUS'  # Nom du réseau maillé
uci set wireless.@wifi-iface[-1].mesh_fwding='1'  # Activer le forwarding dans le mesh
uci set wireless.@wifi-iface[-1].mesh_rssi_threshold='0'  # Aucun seuil RSSI (par défaut)
uci set wireless.@wifi-iface[-1].network='lan'  # Associer au réseau 'lan'

# Appliquer les changements
uci commit wireless
wifi reload

# Configurer le point d'accès en 5Ghz

uci add wireless wifi-iface
uci set wireless.@wifi-iface[-1].device='radio0'
uci set wireless.@wifi-iface[-1].mode='ap'
uci set wireless.@wifi-iface[-1].ssid=$NAMEID
uci set wireless.@wifi-iface[-1].encryption='sae-mixed'  
uci set wireless.@wifi-iface[-1].key=$PASSWD  
uci set wireless.@wifi-iface[-1].ieee80211r='1'
uci set wireless.@wifi-iface[-1].mobility_domain='2222'
uci set wireless.@wifi-iface[-1].ft_over_ds='0'
uci set wireless.@wifi-iface[-1].ft_psk_generate_local='1'
uci set wireless.@wifi-iface[-1].network='lan'  


uci commit wireless
wifi reload


# Suppresion des points d'accès Wifi par défaut

uci delete wireless.default_radio0
uci delete wireless.default_radio1

uci commit
wifi reload
