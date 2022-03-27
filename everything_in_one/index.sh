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


echo "updating Your tmp files"
apt update -y
apt upgrade -y
apt-get update -y
apt-get upgrade -y
apt install zip unzip -y
apt install figlet toilet -y

wings_version="1.6.1"
panel_version="1.7.0"


clear

figlet -c Life is EZ Now

echo ""
echo "* LifeEZ_Pterodactyl installation script @ v1.0.0"
echo "*"
echo "* Copyright (C) 2022 - 2022, DNxRG Development, <discord.gg/dnxrg>"

echo "*"
echo "*"
echo "*"
echo "########################################################################################################"
echo "*                                                                                                      $"
echo "* [1] Install Desired Amount of Swap Memory [GB].                                                      $"
echo "* [2] Install And Setup Database for Pterodactyl.                                                      $"
echo "* [3] Fix The 0 CPU and 0 Memory Bug                                                                   $"
echo "*                                                                                                      $"
echo "########################################################################################################"
echo "*                                                                                                      $"
echo "* [4] Backup Pterodactyl Panel + nginx files with ssl certs + mysql all Databases.                     $"
echo "* [5] Backup Pterodactyl Wings + nginx files with ssl certs + All Server Files + mysql all Databases.  $"
echo "* [6] Both 3 and 4 In The Same Server                                                                  $"
echo "*                                                                                                      $"
echo "########################################################################################################"
echo "*                                                                                                      $"
echo "* [7] Restore Backups Did by Option Number 4.                                                          $"
echo "* [8] Restore Backups Did by Option Number 5.                                                          $"
echo "* [9] Restore Backups Did by Option Number 6.                                                          $"
echo "*                                                                                                      $"
echo "########################################################################################################"
echo "*                                                                                                      $"
echo "* Wings Version $wings_version and panel Version $panel_version is included!                           $"
echo "* If You Notice Any Panel or Wings Update, Please Notify us at our Discord.                            $"
echo "* https://dnxrg.net/discord                                                                            $"
echo "*                                                                                                      $"
echo "########################################################################################################"
echo ""
echo ""

read -p "Enter Input: " input

case $input in  
    1) bash <(curl -s https://raw.githubusercontent.com/NotRoyadma/ptero_database_repo_main/main/swp.sh);;
    2) bash <(curl -s https://raw.githubusercontent.com/NotRoyadma/ptero_database_repo_main/main/database.sh);;
    3) bash <(curl -s https://raw.githubusercontent.com/NotRoyadma/ptero_database_repo_main/main/everything_in_one/fixcpuram.sh);;
    4) echo "Not Developed Yet!";;
    5) echo "Not Developed Yet!";;
    6) echo "Not Developed Yet!";;
    7) echo "Not Developed Yet!";;
    8) echo "Not Developed Yet!";;
    9) echo "Not Developed Yet!";;
    *) echo "Invalid Input;; exit;;";;
esac
