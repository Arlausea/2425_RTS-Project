# Changelog 

1. [Introduction](#introduction)
2. [Session 1](#session-1)
3. [Session 2](#session-2)
4. [Séance 3](#session-3)
5. [Séance 4](#session-4)
6. [Séance 5](#session-5)
7. [Séance 6](#session-6)
8. [Séance 7](#session-7)
9. [Séance 8](#session-8)
10. [Séance 9](#session-9)
11. [Séance 10](#session-10)

## Introduction


## Session 1

### Content (16/10/2024)

* Definition of the topic and tools that we can use
* Try to communicate with the routers over we had a problem with the power in the switch => Try independant wires

### To be done

- [ ] See if we can see them if we connecter every routers independantly
- [ ] Communication with routers 
- [ ] Configuration routers with a computer



## Session 2

### Content (23/10/2024)

* Discussion with the tutor about wires and power problems (connect every router with the adaptator by the Poe and the Lan) and also about ip address problem
* Redefine the ip address in order to be in the same network (see the dependancies and the gateway, give manual ip address for routers and create a network connected to the computer)

### To be done

- [ ] Connect several routers independantly and connect to them remotly
- [ ] Communication with routers
- [ ] Configuration routers with a computer (SNMP?)


## Session 3

### Content (06/11/2024)

* Connection: in D055
  - PC1 -> router / PC2 -> router (doesn't work)
  - Al laptop -> Ar laptop connected to a router (Al ping Ar works, Al ping router -> unreachable)
  
* Reset of one router to change the configuration and connect to it
  - try to connect to the unconfigurated router by web browser

### To be done

- [ ] Connect several routers independantly and connect to them remotly
- [ ] Communication with routers
- [ ] Configuration routers with a computer (SNMP?)


## Session 4

### Content (20/11/2024)

* Installation of openwrt on 4 routers, ssh connection and installation of luci package 
* 3 routers updated and flash with sysupgrade image of stable version with preconfigurations in it


### To be done

- [ ] Fix router which can't be flash with sysupgrade image or factory image because it is in openwrt and it can't be updated because it is on too old snapshots
- [ ] Set a general configuration to apply at all the router to flip in the stable configuration of tplink
- [ ] Config duo DHCP/IPv4 address
- [x] Update Intructions.md for future use and documentation


## Session 5

### Content (27/11/2024)

* Update of the last router (lapin_11) => scp or ssh to flash the image manually instaed of doing it through Luci
* Discussion over next steps with tutor
* Four routers: stable+luci+mesh+pwd

### To be done

* Allocate to each router an IPv6 address to have a double interface DHCP/IP available
* Script config_lapin.sh with argument name ipaddress
  - scp script openwrt
  - ssh -c ...
* Update excel Avancement_ip_balises
  

## Session 6

### Content (04/12/2024)

* Allocate to each router an IPv6 address to have a double interface DHCP/IP available
* Update excel Avancement_ip_balises
* write a script for flash image to configure router with DHCP/IPv6

### To be done

* 


## Session 7

### Content (11/12/2024)

* 

### To be done

* 


## Session 8

### Content (12/12/2024)

* 

### To be done

* 


## Session 9

### Content (17/12/2024)

* 

### To be done

* 




## Session 10

### Presentation (18/12/2024)
