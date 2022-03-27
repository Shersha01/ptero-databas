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
echo "Warning: Make Sure You Have Pterodactyl Panel Installed On This Server, In Order To Resotre All The Backups!"


/bin/sleep 1


DIR="/var/www/pterodactyl/"
if [ -d "$DIR" ]; then
    echo ""
    echo "Pterodactyl is Already Installed Detected.."
    echo ""
    echo "Moving Further"

    echo "Please Specify The Backup URI (Make Sure its Validated And Firewall Wont Restrict it)"

    
    echo "(ex. http://127.0.0.1/Backup/"
    echo ""

    read -p "Enter URI: " sys_bkp_uri
    /bin/sleep 1

    echo "trying to move further"
    echo ""

    /bin/sleep 1

    echo "creating backup directory"
    echo ""
    mkdir /bkpfiles

    cd /bkpfiles

    /bin/sleep 1


    echo ""
    echo "defining variables"

    db_down="all_databases.sql"
    ptero_conf_down="pterodactyl.conf"
    env_file_down=".env"

    db_down_path=$sys_bkp_uri$db_down
    ptero_conf_down_path=$sys_bkp_uri$ptero_conf_down
    env_file_down_path=$sys_bkp_uri$env_file_down

    /bin/sleep 1
    cd /bkpfiles
    echo ""
    echo "downloading backup from origin server!"

    echo ""
    echo "downloading database files"

    curl -O $db_down_path

    echo ""
    echo "downloading pterodactyl config files"

    curl -O $ptero_conf_down_path


    echo ""
    echo "downloading ptero files"

    curl -O $env_file_down_path


    /bin/sleep 2


    echo ""
    echo "moving and migrating databases with all files!"

    mv $env_file_down /var/www/pterodactyl/.env

    mv $ptero_conf_down /etc/nginx/sites-enabled/

    sudo nginx -t

    sudo systemctl restart nginx
    cd /bkpfiles
    mysql < pterodactyl_panel.sql;
    ufw allow 3306

    /bin/sleep 4

    echo ""
    echo "##########################################################################################"
    echo "#                                                                                        #"
    echo "# Successfully Finished Your Restoration..                                               #"
    echo "#                                                                                        #"             #"
    echo "#                                                                                        #"
    echo "# Warning: if your installation wont works try redoing it or checking the firewalls      #"
    echo "#                                                                                        #"
    echo "#                                                                                        #"
    echo "#                                                                                        #"
    echo "# If You Find Any Issues Regarding This, Please Report at - https://dnxrg.net/discord    #"
    echo "#                                                                                        #"
    echo "#                                                                                        #"
    echo "##########################################################################################"

    
else
   echo "Warning: '$DIR' NOT found."
   echo "Please install pterodactyl First To Restore Your Backup.."
fi


