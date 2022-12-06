#!/bin/bash
#
# install ssh server
apt install openssh-server -y
#
# enable the service
systemctl enable ssh
#
# Enable root SSH access
cp -v ./ssh_config.txt /etc/ssh/sshd_config
#
# Generate SSH key
ssh-keygen -f ~/.ssh/sshkey -t rsa -b 4096 -N "$PSWD"