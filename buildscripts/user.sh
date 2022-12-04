#!/bin/sh

# set password
echo "$USER:$PSWD" | chpasswd

# set greeting for user
echo 'sh /buildscripts/greeting.sh' >> ~/.bashrc