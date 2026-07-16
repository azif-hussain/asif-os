#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PACKAGE_FILE="$ROOT_DIR/packages/flatpak.txt"

if ! command -v flatpak >/dev/null 2>&1; then
    echo "Installing Flatpak..."
    sudo dnf install -y flatpak
fi

flatpak remote-add --if-not-exists \
    flathub \
    https://flathub.org/repo/flathub.flatpakrepo

if [[ ! -f "$PACKAGE_FILE" ]]; then
    echo "Package list not found: $PACKAGE_FILE"
    exit 1
fi

mapfile -t packages < <(
    grep -Ev '^[[:space:]]*(#|$)' "$PACKAGE_FILE"
)

if (( ${#packages[@]} == 0 )); then
    echo "No Flatpak applications configured."
    exit 0
fi

echo "Installing Flatpak applications..."

for package in "${packages[@]}"; do
    flatpak install -y flathub "$package"
done

echo "Flatpak applications installed."
