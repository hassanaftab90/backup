#!/bin/sh
# This script will backup the configuration and list of packages from syd04ii

#set variables
CONFIG_FOLDER=/etc
BACKUP_FOLDER=/tmp/backup
HOSTNAME=syd04ii

#make backup directory if it doesn't exist
mkdir -p ${BACKUP_FOLDER}

#remove old backups
rm ${BACKUP_FOLDER}/*.gz

#Backup the list of installed packages
opkg list-installed | cut -f 1 -d ' ' > /etc/packages.txt

#Backup config folder /etc
tar -czf ${BACKUP_FOLDER}/${HOSTNAME}_$(date +%Y%m%d_%H%M).tar.gz ${CONFIG_FOLDER} >/dev/null 2>&1

exit
