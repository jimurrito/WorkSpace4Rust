# Docker Container for code-server4rs
# sudo docker build -t jimurrito/code-server4rs:latest .

FROM ubuntu:kinetic
ENV VER=1.12.02

# > ENV + ARGS
# user config
ENV USER=root
ENV PSWD=password

# Services that will be implemented
# -> VScode Server
# -> Rust (rustup,rustc,cargo,etc)
# -> Docker (Build containers)
# -> Dependancies

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


# > Install VsCode
ADD ./vscode.bash /buildscripts/.
#RUN ls
RUN bash ./vscode.bash
# enable SSH port for VScode remoting
EXPOSE 22

# > Install rust
ADD ./rust.bash /buildscripts/.
RUN bash ./rust.bash

# Install docker
ADD ./docker.bash /buildscripts/.
RUN bash ./docker.bash

# Reload Shell
#RUN bash $HOME/.cargo/env

# Entry point is running VScode server
CMD code-server