#!/bin/sh
#
# Commands that run on conatiner bootup
#
# > Start critical services
service docker start 2> /dev/null
service ssh start
#
# start vs code
echo "Starting VSCode Server"
# output server logs into file
code-server --accept-server-license-terms serve > /wksplogs/code-server.log
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
#
#
# set password on run
if [ "$PSWD" != "ferris" ]; then
    echo "$USER:$PSWD" | chpasswd
fi