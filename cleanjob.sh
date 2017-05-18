#!/bin/sh
#Backup policy: Clean all backups older than 5 iterations
# This script will delete all the files which doesn't meet the backup policy

#Set PATH variable for syd04
PATH1="/mnt/nas02v01/Private/Backups/Networks config backups/syd04"

#set PATH variable for syd04ii
PATH2="/mnt/nas02v01/Private/Backups/Networks config backups/syd04ii"

#set PATH variable for syd04inf
PATH3="/mnt/nas02v01/Private/Backups/Networks config backups/syd04inf"

#set PATH variable for Asterisk
PATH4="/mnt/nas02v01/Private/Backups/Asterisk"




#Number of backups required in days. One backup is generated daily. Eg. a value of
# 5 will save backup of upto 5 days
BACKUPS=5

#count the number of backups in syd04 before deletion
NUMBER1="$(ls -l "$PATH1" | grep syd04 | wc -l)"

#See if the number of backups exceed requirement for syd04
VAR1=$(($NUMBER1-$BACKUPS))
#delete if there are extra backups from syd04

if [ $VAR1 -gt 0 ]
  then
    #find the old backups and delete them in syd04
    find "$PATH1" -mtime +$BACKUPS -type f -delete

fi

#count the number of backups in syd04ii before deletion
NUMBER2="$(ls -l "$PATH2" | grep syd04ii | wc -l)"

#See if the number of backups exceed requirement for syd04ii
VAR2=$(($NUMBER2-$BACKUPS))


#delete if there are extra backups from syd04ii
if [ $VAR2 -gt 0 ]
  then
    #find the old backups and delete them in syd04ii
    find "$PATH2" -mtime +$BACKUPS -type f -delete

fi

#count the number of backups in syd04inf before deletion
NUMBER3="$(ls -l "$PATH3" | grep syd04inf | wc -l)"

#See if the number of backups exceed requirement for syd04inf
VAR1=$(($NUMBER3-$BACKUPS))
#delete if there are extra backups from syd04inf

if [ $VAR1 -gt 0 ]
  then
    #find the old backups and delete them in syd04inf
    find "$PATH3" -mtime +$BACKUPS -type f -delete

fi
