#!/bin/bash

install_docker_ubuntu_debian() {
    echo "Installing Docker on Ubuntu/Debian..."
    apt-get update -y
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update -y
    apt-get install -y docker-ce
}

install_docker_fedora() {
    echo "Installing Docker on Fedora..."
    dnf -y update
    dnf -y install docker
    systemctl start docker
    systemctl enable docker
}

install_docker_arch() {
    echo "Installing Docker on Arch Linux..."
    pacman -Syu --noconfirm
    pacman -S --noconfirm docker
    systemctl start docker
    systemctl enable docker
}

install_docker_other() {
    echo "Please install Docker manually for your distribution."
    exit 1
}

if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        ubuntu|debian)
            install_docker_ubuntu_debian
            ;;
        fedora)
            install_docker_fedora
            ;;
        arch)
            install_docker_arch
            ;;
        *)
            install_docker_other
            ;;
    esac
else
    echo "Unsupported Linux distribution."
    exit 1
fi

systemctl start docker
systemctl enable docker

echo "Docker installed and started successfully."

cd docker-config
docker build -t my-kali-linux .
docker run -it --name kali-container --network host -v kali_data:/root my-kali-linux

