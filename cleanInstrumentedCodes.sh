#!/bin/sh
#
#

group=website
mmsw_path=$1
ser_path=$2
#
# SUDO website if the user is not website
#
SUDO="/usr/local/bin/sudo"
CURRENT_USER=`/usr/bin/id -un`

#
# Run as special user
#
if [ $CURRENT_USER != $group ]; then
        exec $SUDO -u $group $0 $mmsw_path $ser_path
fi

if [ -d $mmsw_path/consumer_backup ]; then
        cd $mmsw_path
        rm -rf consumer
        mv consumer_backup consumer
        ls -altr
else
        echo "No instrumentation codes are found.  It is clean now."
fi

cd $ser_path
rm -f cobertura.ser 
