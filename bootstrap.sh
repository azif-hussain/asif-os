#!/usr/bin/env bash

set -e

echo "====================================="
echo " Installing AsifOS"
echo "====================================="

./scripts/install-dnf.sh
./scripts/install-flatpak.sh
./scripts/install-git.sh
./scripts/install-docker.sh
./scripts/install-chrome.sh

echo
echo "AsifOS base installation complete!"
