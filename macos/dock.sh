#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

if [[ -r "$REPO_ROOT/.env" ]]; then
  source "$REPO_ROOT/.env"
fi

PRIVATE_DOCK_CONFIG="${PRIVATE_DOCK_CONFIG:-$HOME/.config/private/dock.sh}"
if [[ "$PRIVATE_DOCK_CONFIG" != /* ]]; then
  PRIVATE_DOCK_CONFIG="$REPO_ROOT/$PRIVATE_DOCK_CONFIG"
fi

if [[ ! -r "$PRIVATE_DOCK_CONFIG" ]]; then
  echo "Missing private Dock configuration:"
  echo "  $PRIVATE_DOCK_CONFIG"
  exit 1
fi

source "$PRIVATE_DOCK_CONFIG"

if [[ ${#DOCK_APPS[@]} -eq 0 ]]; then
  echo "DOCK_APPS is empty."
  exit 1
fi

if ! command -v dockutil >/dev/null 2>&1; then
  echo "Error: dockutil is not installed."
  echo "Install it with: brew install dockutil"
  exit 1
fi

dockutil --no-restart --remove all

for app in "${DOCK_APPS[@]}"; do
  if [[ -d "$app" ]]; then
    dockutil --no-restart --add "$app"
  else
    echo "Skipping missing app: $app"
  fi
done

killall Dock