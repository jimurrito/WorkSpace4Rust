#!/bin/bash
#
# install dependancies
apt install pkg-config openssl libssl-dev curl gcc -y
#
# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y