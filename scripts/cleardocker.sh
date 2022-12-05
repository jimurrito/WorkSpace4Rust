#!/bin/sh
#
# save all containers
CURCON="$(docker ps -aq)"
# kill all conatainers
echo "Killing containers"
docker kill "$CURCON" 2> /dev/null
# kill all conatainers
echo "Removing containers"
docker rm "$CURCON" 2> /dev/null
# remove images
echo "Removing images"
docker image rm "$(docker image ls -q)" 2> /dev/null
#
echo "Done"