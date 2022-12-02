# Docker Container for code-server4rs
# sudo docker build -t jimurrito/code-server4rs:latest .

FROM rust:slim-buster
ENV VER=1.12.02
USER root

# Services that will be implemented
# -> VScode Server
# -> Rust (rustup,rustc,cargo,etc)
# -> Docker (Build containers)
# -> Dependancies

# Update repos caches and packages
RUN apt update && apt install --upgrade -y
# Install VsCode
RUN bash ./vscode.bash
# enable SSH port for VScode remoting
EXPOSE 22
# Install rust
RUN bash ./rust.bash
# Install docker
RUN bash ./docker.bash

# Entry point is running VScode server
CMD cargo -h && docker -h