# Docker Container for code-server4rs
# sudo docker build -t jimurrito/code-server4rs:latest .

FROM ubuntu:kinetic
ENV VER=1.13.02

# > ENV + ARGS
# user config
ENV USER=root
ENV PSWD=password

# misc
ENV SRVIP=10.3.10.20

# Portainer ports
ENV P9443=9443
ENV P8000=8000

# > Init
# Update repos caches and packages
RUN apt update && apt install --upgrade -y
# Create directory for build scripts
RUN mkdir /buildscripts
WORKDIR /buildscripts

# > Set user password
ADD ./user.bash /buildscripts/.
RUN bash ./user.bash
# set as docker user
USER ${USER}

# > Set Setup SSH Server
ADD ./ssh_config /buildscripts/.
ADD ./ssh.bash /buildscripts/.
RUN bash ./ssh.bash

# > Install VsCode
ADD ./vscode.bash /buildscripts/.
RUN bash ./vscode.bash
# enable SSH port for VScode remoting
EXPOSE 22

# > Install Rust
ADD ./rust.bash /buildscripts/.
RUN bash ./rust.bash

# > Install Docker
ADD ./docker.bash /buildscripts/.
RUN bash ./docker.bash

# > Run Portainer
ADD ./portainer.bash /buildscripts/.
#RUN bash ./portainer.bash

# Entry point is running VScode server
ADD ./startup.bash /buildscripts/.
CMD bash ./startup.bash
#CMD code-server --accept-server-license-terms serve