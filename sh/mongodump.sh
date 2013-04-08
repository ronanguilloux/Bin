#!/bin/sh

date=`date +%u`
/usr/bin/mongodump --directoryperdb -o /var/backups/mongo/$date
