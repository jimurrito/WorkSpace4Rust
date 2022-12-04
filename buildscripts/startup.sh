#!/bin/sh

# > Start critical services
service docker start
service ssh start

# > Set wksp commands alias
echo 'alias wksp="sh /wksp/root.sh"' >> ~/.bashrc

# copy prv SSH key to user-accessible dir
cp -v "$HOME"/.ssh/sshkey "$HOME"/keys/sshkey

# Soft link for volumes
ln -s /root/keys /keys
ln -s /root/workspaces /workspaces

# start vs code
echo "Starting VSCode Server"
code-server --accept-server-license-terms serve
