#!/bin/sh
#
RPATH="/wksp/"
#
# Show help menu
if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ -z "$1" ]; then
    cat "$RPATH"help.info
#
# Show version dump
elif [ "$1" = "--version" ] || [ "$1" = "-v" ]; then
    cat "$RPATH"version.info
#
# list docker conatiners command
elif [ "$1" = "--clist" ] || [ "$1" = "--dockerclist" ] || [ "$1" = "-l" ]; then
    sh "$RPATH"clistdocker.sh "$2"
#
# list docker images command
elif [ "$1" = "--ilist" ] || [ "$1" = "--dockerilist" ] || [ "$1" = "-L" ]; then
    docker image
#
# Build docker command
elif [ "$1" = "--build" ] || [ "$1" = "--dockerbuild" ] || [ "$1" = "-b" ]; then
    sh "$RPATH"builddocker.sh "$2" "$3"
#
# Run docker command
elif [ "$1" = "--run" ] || [ "$1" = "--dockerrun" ] || [ "$1" = "-r" ]; then
    sh "$RPATH"rundocker.sh "$2" "$3"
#
# Clear docker command
elif [ "$1" = "--clear" ] || [ "$1" = "--cleardocker" ] || [ "$1" = "-C" ]; then
    sh "$RPATH"cleardocker.sh
#
# Install a VSCode extension
elif [ "$1" = "--install" ] || [ "$1" = "-i" ]; then
    sh "$RPATH"vscs-install.sh "$2"
#
# Install default VSCode extensions
elif [ "$1" = "--default" ] || [ "$1" = "-I" ]; then
    bash /buildscripts/ext.bash
#
# Edits Root.sh for new commands
elif [ "$1" = "--newcmd" ] || [ "$1" = "-N" ]; then
    sh newcmd.sh "$2"
#
# ---------------------------------
# [[[ CUSTOM COMMANDS ]]]
#
# Template:
# <Command description>
# elif [ "$1" = "--<long-arg>" ] || [ "$1" = "-<short-arg>" ]; then
#    <EXECUTION_COMMAND>
#
# ---------------------------------
#
# Catch all
else
    echo "Unknown argument: '${1}' please use 'wksp -h' or 'wksp --help' for all options"
fi