#!/usr/bin/env bash

echo "Checking current Dock configuration..."
echo "====================================="

if ! command -v dockutil &> /dev/null; then
    echo "Error: 'dockutil' is not installed."
    echo "Install it via: brew install dockutil"
    exit 1
fi

echo -e "\nCurrently pinned items in the Dock:"
dockutil --list | awk -F$'\t' '{print "  - " $1 " (" $2 ")"}'
echo ""