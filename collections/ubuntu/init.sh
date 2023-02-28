#!/bin/bash

skip=[ $1 -eq "-a" ] && 1 || 0

ask {
    echo $1
    read input
    ans=[ $input -eq "y" ] && 1 || 0
}

# Disable Root Login
ask "Disable Root Login?(y/N)"
if [ $skip -eq 0 ] && [ $ans -eq 0 ]; then
    sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
    /etc/init.d/sshd restart
fi

# Install Docker
ask "Install Docker?(y/N)"
if [ $skip -eq 0 ] && [ $ans -eq 0 ]; then
    apt-get update
    apt-get install -y ca-certificates curl gnupg lsb-release
    mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    groupadd docker
fi

# Add User j
ask "Add User j?(y/N)"
if [ $skip -eq 0 ] && [ $ans -eq 0 ]; then
    useradd -m -s /usr/bin/bash j
    echo j:j | chpasswd
    usermod -aG sudo j
    usermod -aG docker j
    cfg_path=/etc/ssh/sshd_config
    echo 'DenyUsers j' >> $cfg_path
fi