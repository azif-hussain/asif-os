#!/usr/bin/env bash

set -e

echo "====================================="
echo " Installing AsifOS"
echo "====================================="

./install/dnf.sh
./install/flatpak.sh
./install/git.sh
./install/docker.sh
./install/chrome.sh

echo
echo "AsifOS base installation complete!"
