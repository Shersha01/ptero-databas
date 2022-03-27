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

/bin/sleep 1


swapon --all
/bin/sleep 1

fallocate -l "$swp_space""g" /mnt/"$swp_space""GiB.swap"

/bin/sleep 1

chmod 600 /mnt/"$swp_space""GiB.swap"

/bin/sleep 1

mkswap /mnt/"$swp_space""GiB.swap"

/bin/sleep 1

swapon /mnt/"$swp_space""GiB.swap"

/bin/sleep 1

cat /proc/swaps

/bin/sleep 1

free -h

#echo '/mnt/"$swp_space"GiB.swap swap swap defaults 0 0' | sudo tee -a /etc/fstab
echo ""
echo "Successfully Installed $swp_space GB of SWAP"
echo ""
echo "Rebooting The System"

/bin/sleep 1


reboot

free -h
