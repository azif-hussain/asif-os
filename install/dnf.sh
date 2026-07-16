#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PACKAGE_FILE="$ROOT_DIR/packages/dnf.txt"

if [[ ! -f "$PACKAGE_FILE" ]]; then
    echo "Package list not found: $PACKAGE_FILE"
    exit 1
fi

mapfile -t packages < <(
    grep -Ev '^[[:space:]]*(#|$)' "$PACKAGE_FILE"
)

if (( ${#packages[@]} == 0 )); then
    echo "No DNF packages configured."
    exit 0
fi

echo "Installing ${#packages[@]} DNF packages..."

sudo dnf install -y "${packages[@]}"

echo "DNF package installation complete."
