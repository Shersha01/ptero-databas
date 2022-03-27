#!/bin/bash
# Init
FILE="/tmp/out.$$"
GREP="/bin/grep"
#....
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "Please Run This Script As A ROOT User" 1>&2
   exit 1
fi
# ...


echo "Mention The Amout Of Swap You Wanna Install in GB (ex. 200)"

read swp_space

swapon --all

fallocate -l $swp_spaceg /mnt/$swp_spaceGiB.swap

chmod 600 /mnt/$swp_spaceGiB.swap

mkswap /mnt/$swp_spaceGiB.swap

swapon /mnt/$swp_spaceGiB.swap

cat /proc/swaps

echo '/mnt/$swp_spaceGiB.swap swap swap defaults 0 0' | sudo tee -a /etc/fstab

reboot

free -h
