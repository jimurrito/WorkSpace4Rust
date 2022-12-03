# create Portainer container :)
docker run -d --restart=always \
--name=portainer -p 8000:$P8000 -p 9443:$P9443 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $HOME/portainer:/data \
portainer/portainer-ce:latest