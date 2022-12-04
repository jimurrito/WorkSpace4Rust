# Docker Container for code-server4rs
# sudo docker build -t jimurrito/code-server4rs:latest .
FROM ubuntu:kinetic

# > ENV + ARGS
# user config
ENV VER=1.12.3
ENV USER=root
ENV PSWD=password
# build const
ENV WRKSP=${HOME}/workspaces
ENV KEYS=${HOME}/keys
# Optional Extensions
# Display Greeting
# 0 = no | 1 = yes (Def)
ENV SHOW_GREETING=1 
# enable SSH port for VScode remoting
EXPOSE 22

# Update repos caches and packages
RUN apt update && apt install --upgrade -y
# Build Dirs
RUN mkdir /buildscripts /wksp /vscodesrv /${WRKSP} ${KEYS}
# Import build scripts
ADD ./buildscripts /buildscripts
WORKDIR /buildscripts

# > Set user password
RUN sh ./user.sh
# set user
USER ${USER}

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

# > Configure workspace commands
ADD ./scripts /wksp

# Entry point is running VScode server
CMD sh ./startup.sh