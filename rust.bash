
# install dependancies
apt install pkg-config openssl libssl-dev curl -y

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# create link
#ln -s $HOME/.cargo/bin/cargo /cargo
#source "$HOME/.cargo/env"
