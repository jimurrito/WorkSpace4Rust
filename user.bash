# create user with power of root
#useradd -ms /bin/bash ${USER}

# Add user to sudoers group
#usermod -G root ${USER}

# set password
chpasswd "$USER:$PSWD"

# login as user
#su - ${USER}