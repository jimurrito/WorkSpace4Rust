#!/bin/sh
#
# General configuration steps
#
# > Set wksp commands alias
echo 'alias wksp="sh /wksp/root.sh"' >> ~/.bashrc
#
# > Copy prv SSH key to user-accessible dir
cp -v "$HOME"/.ssh/sshkey "$KEYS_DIR"/sshkey
#
# > Soft link for volumes
ln -s "$KEYS_DIR" /keys
ln -s "$WORKSPACE_DIR" /workspaces
#
