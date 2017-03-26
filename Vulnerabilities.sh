#!/bin/bash

# Force run as root
if ! which sudo >/dev/null 2>/dev/null; then
    PM_SU_CMD="su - root -c"
elif sudo -nv 2>/dev/null; then
    PM_SU_CMD="sudo"
else
    echo "ERROR: I can't get root." >&2
    exit 1
fi

# Insecure Maximum Pasword
sudo sed -i 's/^PASS_MAX_AGE/PASS_MAX_AGE\t99999/g' /ect/login.defs
echo Maximum password age changed!
sleep 3s # Wait 3 seconds

# Insecure Root Password
echo "root:toor" | chpasswd

# Add Authorized Admins
useradd -d /home/Cyberpatriot -G adm,sudo -s /bin/bash -m Cyberpatriot
useradd -d /home/Sniper -G adm,sudo -s /bin/bash -m Sniper
echo Added administrators Cyberpatriot and Sniper!
sleep 3s 

# Add Authorized Users 
useradd -d /home/Jack -s /bin/bash -m Jack
useradd -d /home/John -s /bin/bash -m John
useradd -d /home/Lindsey -s /bin/bash -m Lindsey 
useradd -d /home/Carl -s /bin/bash -m Carl
echo Added authorized users!
sleep 3s 

# Add Unauthorized Administrators
useradd -d /home/Hacker -G adm,sudo -s /bin/bash -m Hacker
echo Unauthorized administrators added!
sleep 3s

# Add Unauthorized Users 
useradd -d /home/Tim -s /bin/bash -m Tim
useradd -s /home/Joseph -s /bin/bash -m Joseph
echo Unauthorized users added!
sleep 3s

# Disable UFW Firewall
sudo ufw disable

# Hacking Software
sudo snap install john-the-ripper
echo Hacking software installed!
sleep 3s
