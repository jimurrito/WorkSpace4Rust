#!/bin/sh
#
# NOT WORKING
# Creates custom non-root user if selected
if [ "$USER" != "root" ]; then
    # makesure name is lowercase
    USER=$(echo "$USER"| tr '[:upper:]' '[:lower:]')
    # create user as root user
    adduser --home "/home/$USER" --shell "/bin/bash" --gid 0 "$USER" --disabled-password --gecos ""
fi
#
# set password on build
echo "$USER:$PSWD" | chpasswd
#
# set greeting for user
echo 'sh /buildscripts/greeting.sh' >> ~/.bashrc
#
