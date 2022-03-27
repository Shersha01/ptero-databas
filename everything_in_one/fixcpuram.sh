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


apt install tar -y 

clear
echo ""
echo "Trying To Fix The Docker Bug Of The Pterodactyl"
echo ""

/bin/sleep  1

echo "Making Directory"
mkdir /fixramcpu
cd /fixramcpu

/bin/sleep 1
echo ""
echo "Downlaoding The Docker Files"
curl -O https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz

/bin/sleep 1
echo ""
echo "Extracting Files"
tar -xzvf docker-20.10.9.tgz

/bin/sleep 1
echo ""
echo "Moving Files to Main Directory"
cd /fixramcpu/docker/
mv * /usr/bin/ 


/bin/sleep 1
echo ""
echo "Finalizing The Steps!"
rm -rf /fixramcpu

/bin/sleep 1
echo ""
echo "##########################################################################################"
echo "#                                                                                        #"
echo "# The Fixup Was Successfull!                                                             #"
echo "# Thanks for Using Our Script                                                            #"
echo "# If You Find Any Issues Regarding This, Please Report at - https://dnxrg.net/discord    #"
echo "#                                                                                        #"
echo "# Run reboot Command To Make it Work!                                                    #"
echo "#                                                                                        #"
echo "####################################"
