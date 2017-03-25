#!/bin/bash

# Insecure Maximum Pasword
sed -i 's/^PASS_MAX_AGE/PASS_MAX_AGE\t99999/g' /ect/login.defs

# Insecure Root Password
echo "root:toor" | chpasswd

# Add Authorized Admins
useradd -d /home/Cyberpatriot -G adm,sudo -s /bin/bash -m Cyberpatriot
useradd -d /home/Sniper -G adm,sudo -s /bin/bash -m Sniper
echo Added administrators Cyberpatriot and Sniper!

# Add Authorized Users 
useradd -d /home/Jack -s /bin/bash -m Jack
useradd -d /home/John -s /bin/bash -m John
useradd -d /home/Lindsey -s /bin/bash -m Lindsey 
useradd -d /home/Carl -s /bin/bash -m Carl

# Add Unauthorized Administrators
useradd -d /home/Hacker -G adm,sudo -s bin/bash -m Hacker

# Add Unauthorized Users 
useradd -d /home/Tim -s /bin/bash -m Tim
useradd -s /home/Joseph -s /bin/bash -m Joseph

# Disable UFW Firewall
sudo ufw disable