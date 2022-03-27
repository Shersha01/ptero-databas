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


echo ""
echo "Running Backup Script!"

/bin/sleep 1

echo ""
echo "Installing Essentials"

/bin/sleep 1

apt install nginx -y 


echo ""
clear


echo ""
echo "trying To Create The BKP main DIR"

mkdir /uploads
mkdir /uploads/Backup

echo ""
echo "Made The Essential Directories"


echo ""
echo "Installing New Nginx Config"

cd /etc/nginx/sites-enabled/
curl -O https://raw.githubusercontent.com/NotRoyadma/ptero_database_repo_main/main/bkpfiles.conf

echo ""
echo "Restarting nginx"
sudo nginx -t
sudo systemctl restart nginx
systemctl restart nginx

echo ""
echo "trying to get the system extrernal ip..."

apt install wget -y 

echo ""

sys_ip=`wget -qO- http://ipecho.net/plain | xargs echo`


echo "i Got The ip - $sys_ip. if it's Not Correct Please Let The Script Completely Run."
/bin/sleep 1
echo "."
/bin/sleep 1
echo "..."
/bin/sleep 1
echo "...."
/bin/sleep 1
echo "....."


echo ""

/bin/sleep 1

echo "getting the pterodactyl nginx backup"

cp /etc/nginx/sites-enabled/pterodactyl.conf /uploads/Backup/


echo ""
echo "getting the pterodactyl env files"

cp /var/www/pterodactyl/.env /uploads/Backup/

/bin/sleep 1


echo ""
echo "Please enter your Pterodactyl Domain"

read -p "Enter Domain: " sys_ptero_domain

/bin/sleep 1

echo ""
echo "Getting ssl files. (make sure this fqdn is correct becoz we dont check it like ptero script)"


# cp -r /etc/letsencrypt/live/$sys_ptero_domain /uploads/Backup/

/bin/sleep 1

echo ""
echo "Please Enter The Name of Your Panel (ex. MyPanel)"
read -p "Enter Name: " sys_ptero_name


/bin/sleep 1


echo ""
echo "getting mysql backups"

cd /uploads/Backup/
mysqldump -u root --all-databases > all_databases.sql;



/bin/sleep 1
echo ""
echo "##########################################################################################"
echo "#                                                                                        #"
echo "# Successfully Finished Your Backup..                                                    #"
echo "# Things You Have To Remeber                                                             #"
echo "#                                                                                        #"
echo "#1) Your BackupURI is http://$sys_ip:8001/Backup/   (Case Sensitive Data)                #"
echo "#2) Make Sure You've Inputted The Correct Panel Domain - $sys_ptero_domain               #"
echo "#                                                                                        #"
echo "# Warning: If You Have Firewalls Settupped Please Disable all of Them or Allow Ports!!   #"
echo "#                                                                                        #"
echo "#                                                                                        #"
echo "#                                                                                        #"
echo "# If You Find Any Issues Regarding This, Please Report at - https://dnxrg.net/discord    #"
echo "#                                                                                        #"
echo "# Run The Base Script To Restore Your Backup onto another server                         #"
echo "#                                                                                        #"
echo "##########################################################################################"
