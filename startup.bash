#!/bin/bash
# Build portainer
service docker start && bash ./portainer.bash

# > Setup SSH keys
# Generate SSH key
ssh-keygen -f $HOME/.ssh/sshkey -t rsa -b 4096
# Add key to server
ssh-copy-id -i $HOME/.ssh/sshkey root@$HOST

# start vs code
code-server --accept-server-license-terms serve