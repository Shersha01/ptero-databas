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

swapon --all

clear


echo "Mention The Amout Of Swap You Wanna Install in GB (ex. 200)"

read swp_space

echo "Please Mention The Path to Swap File, (/mnt/)"

read swp_path

echo ""
echo "Defining Variables"
swp_g="$swp_space""g"
swp_gib_swp="$swp_space""GiB.swap"

/bin/sleep 1



/bin/sleep 1

fallocate -l $swp_g $swp_path$swp_gib_swp

/bin/sleep 1

chmod 600 $swp_path$swp_gib_swp

/bin/sleep 1

ls /mnt/

/bin/sleep 1

sudo mkswap $swp_path$swp_gib_swp

/bin/sleep 1

sudo swapon $swp_path$swp_gib_swp

/bin/sleep 1

cat /proc/swaps

/bin/sleep 1

echo "Defining FileName"

free -h

echo "$swp_path$swp_gib_swp swap swap defaults 0 0" | sudo tee -a /etc/fstab
/bin/sleep 1

echo ""
echo "Successfully Installed $swp_space GB of SWAP"
echo ""
echo "Rebooting The System"

/bin/sleep 1

echo ": Run Reboot To enable Swap"
