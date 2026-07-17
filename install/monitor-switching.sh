#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_DIR="$ROOT_DIR/config/monitor"
TARGET_DIR="$HOME/.local/bin"

echo "Installing ddcutil..."
sudo dnf install -y ddcutil

echo "Installing monitor-switch scripts..."
mkdir -p "$TARGET_DIR"

install -m 0755 \
    "$SOURCE_DIR/switch-to-fedora" \
    "$TARGET_DIR/switch-to-fedora"

install -m 0755 \
    "$SOURCE_DIR/switch-to-mac" \
    "$TARGET_DIR/switch-to-mac"

echo
echo "Monitor switching installed."
echo
echo "Fedora: $TARGET_DIR/switch-to-fedora"
echo "Mac:    $TARGET_DIR/switch-to-mac"
echo
echo "Assign KDE shortcuts manually:"
echo "  Alt+Shift+1 -> switch-to-fedora"
echo "  Alt+Shift+2 -> switch-to-mac"
