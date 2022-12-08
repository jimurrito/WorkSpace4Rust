# Docker Container for workspace4rs
# sudo docker build -t jimurrito/workspace4rs:latest .
FROM ubuntu:kinetic
#
# > ENV + ARGS
ENV VER=1.12.8
# user config
#ARG USER=root # custom user will be fixed in the future
#ENV USER=${USER}
ENV USER=root
ARG PSWD=ferris
ENV PSWD=${PSWD}
# OPTIONAL setting for default VS Code extensions (NOT WORKING)
#ARG DEFAULT_VSC_EXT=1
#ENV DEFAULT_VSC_EXT=${DEFAULT_VSC_EXT}
# OPTIONAL Git user and email input
ARG GIT_USER_NAME=""
ENV GIT_USER_NAME=${GIT_USER_NAME}
ARG GIT_USER_EMAIL=""
ENV GIT_USER_EMAIL=${GIT_USER_EMAIL}
# build const
ENV WORKSPACE_DIR=${HOME}/workspaces
ENV KEYS_DIR=${HOME}/keys
# enable SSH port for VScode remoting
EXPOSE 22
#
# Update repos caches and packages
RUN apt update && apt install --upgrade -y
# Build Dirs
RUN mkdir /buildscripts /wksp /wksplogs
# Import build scripts
ADD ./buildscripts /buildscripts
WORKDIR /buildscripts
#
# > Set user password
RUN sh ./user.sh
# > Set user
USER ${USER}
#
# > Set Setup SSH Server
RUN sh ./ssh.sh
# > Install VsCode
RUN sh ./vscode.sh
# > Install Python3-Pip
RUN sh ./python.sh
# > Install Rust
RUN sh ./rust.sh
# > Install Docker
RUN sh ./docker.sh
# > Install Misc.
RUN apt install nano vim -y
#
# > Configure workspace commands
ADD ./scripts /wksp
#
# > Final Setup
RUN sh ./setup.sh
#
# > Volume for docker config
VOLUME [ "/var/lib/docker" ]
# > Volume for Workspace share
VOLUME [ "/workspace" ]
# > Volume for keys share
VOLUME [ "/keys" ]
#
# Entry point is running VScode server
CMD sh ./startup.sh