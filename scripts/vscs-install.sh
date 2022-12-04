#!/bin/sh
# $1 == ext to be installed
if [ -z "$1" ]; then
    echo "Please provide a VSCode extension to be installed on the server"
else
    code --force --install-extension "$1"
fi