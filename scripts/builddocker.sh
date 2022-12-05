#!/bin/sh
#
# Shortcut for building conatiners
#
# Check if command has subcommands
if [ -z "$1" ]; then
    echo "Building a Container requires atleast 1 argument"
    echo 'Usage: wksp -b "<(Req)dockertag>" "<(Opt)dockerfile_path>"'
# Check if remote dockerfile path was supplied
elif [ -n "$2" ]; then
    docker build -f "$2" -t "$1" .
# no conatiner name was supplied
else
    docker build -t "$1" .
fi
