#!/bin/sh
#
# Shortcut for listing conatiners
#
# Check if command has subcommands
if [ "$1" = "-a" ] || [ "$1" = "--all" ]; then
    docker ps -a
# catch all - show running
else
    docker ps
fi