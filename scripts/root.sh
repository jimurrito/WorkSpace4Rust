#!/bin/sh
#
RPATH="/wksp/"

# Clear docker command
if [ "$1" = "--clear" ] || [ "$1" = "--cleardocker" ] || [ "$1" = "-C" ]; then
    sh "$RPATH"cleardocker.sh
# Install a VSCode extension
elif [ "$1" = "--install" ] || [ "$1" = "-i" ]; then
    sh "$RPATH"vscs-install.sh "$2"
# Install default VSCode extensions
elif [ "$1" = "--default" ] || [ "$1" = "-I" ]; then
    bash /buildscripts/ext.bash
# Enable/Disable Greeting
elif [ "$1" = "--greeting" ] || [ "$1" = "-g" ]; then
    sh "$RPATH"showgreet.sh "$2"
# Show help menu
elif [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ -z "$1" ]; then
    cat "$RPATH"help.info
# Show version dump
elif [ "$1" = "--version" ] || [ "$1" = "-v" ]; then
    cat "$RPATH"version.info
# Catch all
else
    echo "Unknown argument: '${1}' please use 'wksp -h' or 'wksp --help' for all options"
fi