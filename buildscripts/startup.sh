#!/bin/sh
#
# > Start critical services
service docker start 2> /dev/null
service ssh start
#
# start vs code
echo "Starting VSCode Server"
# output server logs into file
code-server --accept-server-license-terms serve > /wksplogs/code-server.log
