#!/bin/sh
#
# Custom user: NOT WORKING
# FIX: Move this to startup, so it can be ran on runtime and not build.
#       Then use alias for ROOT instead of new user, then have logon user be alias of root :)
#       Logon user can be set at runtime by setting env var to current session and .bashrc
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
# set per-session greeting for user
echo 'sh /buildscripts/greeting_b.sh' >> ~/.bashrc
#
# set per-login greeting for user
echo 'sh /buildscripts/greeting_p.sh' >> ~/.profile