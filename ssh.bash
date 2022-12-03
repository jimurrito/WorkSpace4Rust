# install ssh server
apt install openssh-server -y

# enable the service
systemctl enable ssh

# Enable root SSH access
cp -v ./ssh_config /etc/ssh/sshd_config

# start ssh service
service ssh start