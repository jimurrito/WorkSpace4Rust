# Docker Container for workspace4rs
# sudo docker build -t jimurrito/workspace4rs:latest .
FROM ubuntu:kinetic
#
# > ENV + ARGS
# user config
ENV VER=1.12.4
# Allow setting custom user. User is just root renamed to that user provided name. Default should be 'dev'
ENV USER=root
ARG PSWD=password
ENV PSWD=${PSWD}
# build const
ENV WORKSPACE_DIR=${HOME}/workspaces
ENV KEYS_DIR=${HOME}/keys
# Optional Extensions
# Display Greeting
# 0 = no | 1 = yes (Def)
ARG SHOW_GREETING=1
ENV SHOW_GREETING=${SHOW_GREETING}
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
# Entry point is running VScode server
CMD sh ./startup.sh