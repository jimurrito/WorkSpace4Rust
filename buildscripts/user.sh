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
# set password
echo "$USER:$PSWD" | chpasswd
#
# set greeting for user
echo 'sh /buildscripts/greeting.sh' >> ~/.bashrc
#
# Set git config
# user.name
if [ -n "$GIT_USER_NAME" ]; then
    git config --global user.name "$GIT_USER_NAME" >> ~/.bashrc
    echo "Git user name set: [$GIT_USER_NAME]"
fi
# user.email
if [ -n "$GIT_USER_EMAIL" ]; then
    git config --global user.email "$GIT_USER_EMAIL" >> ~/.bashrc
    echo "Git user name set: [$GIT_USER_EMAIL]" 
fi