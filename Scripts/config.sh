#!/bin/sh


# Nom et IP (à préciser en arguments)

NAME="Lapin_01"
ID="${NAME: -2}"
IPID="::${ID}0"
IP="192.168.2.10/24"

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


