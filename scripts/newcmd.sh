#!/bin/sh
#
# Opens root.sh to be edited
# no optional editor was provided, use nano
if [ -z "$1" ]; then
    nano /wksp/root.sh
# IDE arg was provided
else
    "$1" /wksp/root.sh
fi