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


DIR="/etc/pterodactyl/"
if [ -d "$DIR" ]; then
    echo ""
    echo "Pterodactyl Wings are Already Installed Detected.."
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
    wings_config_folder_down="wings_config_folder.zip"
    wings_data_down="datawings.zip"

    db_down_path=$sys_bkp_uri$db_down
    wings_config_folder_down_path=$sys_bkp_uri$wings_config_folder_down
    wings_data_down_path=$sys_bkp_uri$wings_data_down

    /bin/sleep 1
    cd /bkpfiles
    echo ""
    echo "downloading backup from origin server!"

    echo ""
    echo "downloading database files"

    curl -O $db_down_path

    echo ""
    echo "downloading wings config files"

    curl -O $wings_config_folder_down_path


    echo ""
    echo "downloading wings data"
    echo ""
    echo "this can take several minutes according to internet speed and size."

    echo ""

    /bin/sleep 5

    curl -O $wings_data_down_path


    /bin/sleep 2


    echo ""
    echo "moving and migrating databases with all files!"

    cd /bkpfiles
    mv $wings_config_folder_down /etc/pterodactyl/
    cd /etc/pterodactyl/
    unzip $wings_config_folder_down
    rm $wings_config_folder_down


    cd /bkpfiles
    mkdir /var/lib/pterodactyl
    mv $wings_data_down /var/lib/pterodactyl
    cd /var/lib/pterodactyl
    unzip $wings_data_down
    rm $wings_data_down

    sudo nginx -t

    sudo systemctl restart nginx
    cd /bkpfiles
    mysql < pterodactyl_wings.sql;
    ufw allow 3306

    /bin/sleep 4

    echo ""
    echo "##########################################################################################"
    echo "#                                                                                        #"
    echo "# Successfully Finished Your Wings Restoration..                                         #"
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


