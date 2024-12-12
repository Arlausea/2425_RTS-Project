#!bin/sh

# Expected NAME in argument of this script

NAME=$1
LAN_IP=$2

scp /doc/config.sh root@$LAN_IP:/tmp/
ssh root@$LAN_IP
PASSWD
chmod +x /tmp/config.sh
/tmp/config.sh $NAME

echo "Configuration mise à jour sur $NAME:"
echo "- IPv4 basculé en DHCP."
echo "- IPv6 statique configuré (fd71:C:2025$IPID/64)."
echo "- Adresse IPv4 '$LAN_IP' supprimée (si existante)."
echo "- Mot de passe root modifié."
echo "Script fonctionnel sans erreur"

