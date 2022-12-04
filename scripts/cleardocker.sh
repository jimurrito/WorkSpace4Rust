#!/bin/sh

# save all containers
CURCON="$(docker ps -aq)"
# kill all conatainers
echo "Killing containers"
docker kill "$CURCON"
# kill all conatainers
echo "Removing containers"
docker rm "$CURCON"
# remove images
echo "Removing images"
docker image rm "$(docker image ls -q)"

echo "Done"