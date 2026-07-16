#!/usr/bin/env bash

set -euo pipefail

SOURCE_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/config/keyd/apple-magic-keyboard.conf"
TARGET_FILE="/etc/keyd/apple-magic-keyboard.conf"

if ! command -v keyd >/dev/null 2>&1; then
    echo "keyd is not installed."
    echo "Install it before applying this profile."
    exit 1
fi

echo "Validating keyboard configuration..."
sudo keyd check "$SOURCE_FILE"

echo "Installing Apple Magic Keyboard profile..."
sudo install -m 0644 "$SOURCE_FILE" "$TARGET_FILE"

echo "Reloading keyd..."
sudo keyd reload

echo "macOS-style keyboard profile installed."
