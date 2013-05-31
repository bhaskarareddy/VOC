#!/bin/sh
#
#

group=website
path=$1
#
# SUDO website if the user is not website
#
SUDO="/usr/local/bin/sudo"
CURRENT_USER=`/usr/bin/id -un`

#
# Run as special user
#
if [ $CURRENT_USER != $group ]; then
        exec $SUDO -u $group $0 $path
fi

# cp -r $1/$2/$3/mobile .
cp -rf $path/consumer .
