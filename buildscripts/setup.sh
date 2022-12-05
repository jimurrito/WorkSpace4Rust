#!/bin/sh
#
# General configuration steps
#
# > Set wksp commands alias
echo 'alias wksp="sh /wksp/root.sh"' >> ~/.bashrc
#
# > Create volumes
mkdir ~/workspaces ~/keys 2> /dev/null
#
# > Copy prv SSH key to user-accessible dir
cp -v ~/.ssh/sshkey ~/keys/sshkey
#
# > Soft link for volumes
ln -s ~/keys /keys  2> /dev/null
ln -s ~/workspaces /workspaces  2> /dev/null
#
