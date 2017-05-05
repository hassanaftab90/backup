#!/bin/sh
#This script runs the backup scripts on syd04 and syd04ii and copies the backup files nas02


#run the backup script remotely on syd04
cat /mnt/nas02v01/Private/Scripts/backup_syd04.sh | ssh root@10.50.240.1
sleep 1
#copy the filegz archive made by backup_syd04.sh
scp root@10.50.240.1:/tmp/backup/* /mnt/nas02v01/Private/Backups/Networks\ config\ backups/syd04/

#run the backup script remotely on syd04ii
cat /mnt/nas02v01/Private/Scripts/backup_syd04ii.sh | ssh root@10.50.80.1
sleep 1
#copy the filegz archive made by backup_syd04ii.sh
scp root@10.50.80.1:/tmp/backup/* /mnt/nas02v01/Private/Backups/Networks\ config\ backups/syd04ii/

exit
