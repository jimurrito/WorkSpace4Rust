#!/bin/sh
#
# General Session configuration steps
# mainly adding settings to ~/.bashrc
#
# > Set env vars to be persistent
{ echo "export VER='$VER'"; } >> ~/.bashrc # echo "echo "export LC_CTYPE=en_US.UTF-8"; export LC_ALL=en_US.UTF-8"; Removed
#
# > Set wksp commands alias
echo 'alias wksp="sh /wksp/root.sh"' >> ~/.bashrc
#
# > Create volumes
mkdir ~/workspaces ~/keys 2> /dev/null
#
# (DEPRECATED) Copy prv SSH key to user-accessible dir (-n for no-cobble)
#echo "cp -vfn ~/.ssh/sshkey ~/keys/." >> ~/.bashrc
#
# > Soft link for volumes
ln -s ~/.ssh /keys  2> /dev/null
ln -s ~/workspaces /workspaces  2> /dev/null
#
