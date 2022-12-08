#!/bin/sh
#
# General Session configuration steps
# mainly adding settings to ~/.bashrc
#
# > Set env vars to be persistent
{ echo "export VER='$VER'"; } >> ~/.profile 
#
# > Set wksp commands alias
echo 'alias wksp="sh /wksp/root.sh"' >> ~/.bashrc
#
# > Create volumes
mkdir ~/workspaces ~/keys 2> /dev/null
#
# > Soft link for volumes
ln -s ~/.ssh /keys  2> /dev/null
ln -s ~/workspaces /workspaces  2> /dev/null
#
