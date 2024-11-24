#  Instructions pour configurer un routeur:

## Introduction

Les méthodes pour configurer le routeur varie selon la version installée par défaut sur le routeur. Merci de suivre les instructions suivants les versions ci dessous.
## Version Factory

La méthode la plus simple dans ce cas est par l'interface web de Tp-Link qui nous permettra par la suite de flasher le routeur et de changer facilement le firmware

### Etape 1: Vérifier sa connexion dans le même réseau

Par défaut, le routeur a pour adresse IP `192.168.1.1`.  
Aller dans la configuration de votre réseau puis régler l'adresse IP de votre ordinateur dans ce sous-réseau `192.168.1.2/24` vous permettant de voir le routeur.

> Remarque:  
N'hésitez pas à regarder sur Wireshark l'interface du réseau en question afin de vérfier l'adresse IP du routeur pour adapter notre adresse IP dans réseau en conséquence. 

N'hésitez pas non plus à utilser la commande `nmap -sn [votre IP dans le sous réseau]`pour faire une reconnaissance des appareils disponibles.


![Photo de Wireshark]()
![Photo de la configuration réseau]()

### Etape 2: Ouvrir l'interface web


### Etape 3: Flash le nouveau firmware


Lien pour le fichier factory:

## Version Openwirt Snapshot

### Etape 1







## To be rewrite


```sh
ssh root@192.168.1.1
```
Expliquer comment se connecter à un routeur (changement d'IP) et tout
Trouver l'ip du routeur:
faire un nmap 192.168.1.2/24
Une fois l'ip trouver se connecter en ssh root@<ipaddress>
faire les commandes:
* uci set network.lan.proto="dhcp"
* uci commit network
* /etc/init.d/network restart

Se connecter au router
Trouver l'ip du routeur:
faire un nmap 192.168.1.2/24

Comment mettre le routeur dans la configuration qu'on souhaite

Flasher le router pour le mettre à jour avec la version stable:

SI Factory 
Passer par l'image facotry

SI Openwirt 
Passer par l'image openw
Dans l'image
ajouter les deux commandes, -basic et +autre commande
ajouter une partie config de mdp

ajouter script pour prédéfinir les adresse ipv4, passer en ipv6?

Créer nouvelle interface DHCP pour config dhcp, et nouvelle config static pour ipv4 (attention à la priorité des interfaces)
