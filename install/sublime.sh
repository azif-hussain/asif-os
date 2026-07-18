#!/usr/bin/env bash

set -euo pipefail

echo "Installing Sublime Text..."

sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg

sudo dnf config-manager addrepo \
    --from-repofile=https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

sudo dnf install -y sublime-text

echo
echo "Sublime Text installed."
subl --version
