#!/bin/sh
# enables and disables new session greetings
#
if [ "$1" -eq 1 ] || [ "$1" = "true" ]; then
    echo "Session Greetings Enabled"
    export SHOW_GREETING=1
elif [ "$1" -eq 0 ] || [ "$1" = "false" ]; then
    echo "Session Greetings Disabled"
    export SHOW_GREETING=0
else
    echo "Input is not recognized: '$1'"
fi