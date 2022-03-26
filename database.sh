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


apt install toilet figlet -y

apt install python -y


figlet -f small "Database Installation Pterodactyl"


echo "################################################"
echo "Database Installation for Pterodactyl"
echo "Author - [Not Your Buissness]"
echo "- Make Sure to Run This Script With Sudo Perms!!"
echo ""
echo "Starting Database Installation"

/bin/sleep 5
echo ""
echo "UFW Database Ip"

ufw allow from 172.16.0.0/14
ufw allow 3306

/bin/sleep 3

echo ""
echo "Changing The MySQL Config Files"

curl -O https://raw.githubusercontent.com/NotRoyadma/ptero_database_repo_main/main/replace.py

python ./replace.py

rm ./replace.py

echo ""

echo "ENTER THE USER YOU WANT FOR PTERODACTYL."

read db_username

echo ""

echo "ENTER THE PASSWORD YOU WANT FOR PTERODACTYL."

read db_password

echo ""
echo ""
echo ""

/bin/sleep 3


echo "CREATING DATABASE.."
/bin/sleep 3

mysql -e "create user '$db_username'@'%' identified by '$db_password'; grant all privileges on *.* to '$db_username'@'%' with grant option; flush privileges;"
/bin/sleep 3
echo ""
echo "Successfully Created A Database For Your Pterodactyl! With Username ($db_username) and Password ($db_password)!"
echo ""
echo "Make Sure To Support us - https://discord.gg/dnxrg"
