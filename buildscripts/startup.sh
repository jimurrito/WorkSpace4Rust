#!/bin/sh
#
# Commands that run on conatiner bootup
# Runtime user set
echo "$USER:$PSWD" | chpasswd
#
# > Start critical services
service docker start 2> /dev/null
service ssh start
#
# Push env from docker run, into env (NOT WORKING)
#echo "export DEFAULT_VSC_EXT='$DEFAULT_VSC_EXT'" >> ~/.bashrc
#export DEFAULT_VSC_EXT="$DEFAULT_VSC_EXT"
#
# Set git config
# user.name
if [ "$GIT_USER_NAME" ]; then
    git config --global user.name "$GIT_USER_NAME" >> ~/.profile # runs on login, not each new shell
    echo "Git user name set: [$GIT_USER_NAME]"
fi
# user.email
if [ "$GIT_USER_EMAIL" ]; then
    git config --global user.email "$GIT_USER_EMAIL" >> ~/.profile
    echo "Git user email set: [$GIT_USER_EMAIL]" 
fi
#
# MUST BE LAST
# start vs code
echo "Starting VSCode Server"
# output server logs into file
code-server --accept-server-license-terms serve > /wksplogs/code-server.log