#!/usr/bin/env bash

set -euo pipefail

echo "Installing Docker Engine..."

if command -v docker >/dev/null 2>&1; then
    echo "Docker is already installed:"
    docker --version
else
    sudo dnf install -y dnf-plugins-core

    sudo dnf config-manager addrepo \
        --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo

    sudo dnf install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin
fi

echo "Enabling Docker service..."
sudo systemctl enable --now docker

if ! groups "$USER" | grep -qw docker; then
    echo "Adding $USER to the docker group..."
    sudo usermod -aG docker "$USER"

    echo
    echo "You must log out and back in before Docker works without sudo."
else
    echo "$USER is already in the docker group."
fi

echo
docker --version
docker compose version

echo "Docker installation complete."
