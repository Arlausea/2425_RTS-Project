#!bin/sh

# Expected NAME in argument of this script

NAME=$1
LAN_IP=$2
ID="${NAME: -2}"
IPID="::${ID}0"
IP="192.168.2.${ID}0/24"

scp /doc/config.sh root@$LAN_IP:/tmp/
ssh root@$LAN_IP
echo -e "theseus-2023\ntheseus-2023" | passwd root
chmod +x /tmp/config.sh
/tmp/config.sh $NAME
exit

echo "Execution du script config.sh réussie"
echo "Configuration mise à jour sur $NAME:"
echo "- IPv4 basculé en DHCP."
echo "- IPv6 statique configuré (fd71:C:2025$IPID/64)."
echo "- Adresse IPv4 '$IP' supprimée (si existante)."
echo "- Mot de passe root modifié."
echo "Script fonctionnel sans erreur"

