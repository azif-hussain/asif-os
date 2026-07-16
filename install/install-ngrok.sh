	#!/usr/bin/env bash

set -e

echo "Installing ngrok..."

TMP_DIR=$(mktemp -d)

cd "$TMP_DIR"

wget -q https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz

sudo tar -xzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin

rm -rf "$TMP_DIR"

echo
echo "Installed:"
ngrok version

echo
echo "Next:"
echo "ngrok config add-authtoken YOUR_TOKEN"
