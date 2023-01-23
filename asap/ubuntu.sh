#!/bin/bash

install_docker() {
    apt-get update
    apt-get install -y ca-certificates curl gnupg lsb-release
    mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update
    apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    groupadd docker
}

dsb_root_lgn() {
    sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
    /etc/init.d/sshd restart
}

adduser_j() {
    useradd -m -s /usr/bin/bash j
    echo j:j | chpasswd
    usermod -aG sudo j
    usermod -aG docker j
}

dsb_root_lgn
install_docker
adduser_j