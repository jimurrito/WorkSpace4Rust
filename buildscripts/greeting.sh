#!/bin/sh
#
# only display if greets are enabled
#
# Greeting
# Logic forces welcome message to run only once.
if [ "$WELCOME" != '1' ]; then
    echo "Welcome to CodeServer4Rs by Jimurrito v""$VER"
    # save var to bash profile
    echo "export WELCOME='1'" >> ~/.bashrc
fi
echo "Type 'wksp' to view the shortcuts built into this workspace"
#
# Ensures Docker is on
#service docker start 1>&2 2> /dev/null
#
# FUTURE MSG(s)
# - Active Docker container count
# - size of images (GBs)