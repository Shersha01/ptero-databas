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
echo "This Script Will Just Run The Both Scripts And Also Export Your Databases!"
echo ""

/bin/sleep 3

echo ""
echo "Exectuting Panel Backup Script..."
echo ""

/bin/sleep 2


bash <(curl -s https://raw.githubusercontent.com/NotRoyadma/ptero_database_repo_main/main/everything_in_one/ptero_panel_nginx_mysql.sh)


/bin/sleep 2

echo ""
echo "panel backup completed!"


/bin/sleep 2

echo ""
echo "starting wing's backup script"

/bin/sleep 2

bash <(curl -s https://raw.githubusercontent.com/NotRoyadma/ptero_database_repo_main/main/everything_in_one/ptero_wings_nginx_mysql_serverfiles.sh)

echo ""
echo "wings backup completed"


/bin/sleep 2

    echo ""
    echo "##########################################################################################"
    echo "#                                                                                        #"
    echo "# Successfully Finished Your Panel = Wings Backup                                        #"
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
