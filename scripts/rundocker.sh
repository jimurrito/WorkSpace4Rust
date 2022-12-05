#!/bin/sh
#
# Shortcut for running conatiners
#
# Check if command has subcommands
if [ -z "$1" ]; then
    echo "Running a Container requires atleast 1 argument"
    echo 'Usage: wksp -r "<(Req)dockertag>" "<(Opt)containername>"'
# Check if conatiner name was supplied
elif [ -n "$2" ]; then
    docker run --name="$2" "$1"
# no conatiner name was supplied
else
    docker run "$1"
fi