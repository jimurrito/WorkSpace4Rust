#!/bin/sh

# get deps
apt install wget -y

# download and run installer
wget -O- https://aka.ms/install-vscode-server/setup.sh | sh