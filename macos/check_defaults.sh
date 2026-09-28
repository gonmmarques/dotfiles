#!/usr/bin/env bash

echo "Reading current macOS configurations..."
echo "====================================="

# Helper function to read default values and handle unset errors cleanly
read_default() {
  local domain=$1
  local key=$2
  local extra_flag=$3
  
  local output
  if [[ -n "$extra_flag" ]]; then
    output=$(defaults "$extra_flag" read "$domain" "$key" 2>/dev/null)
  else
    output=$(defaults read "$domain" "$key" 2>/dev/null)
  fi
  
  # If a key isn't explicitly set in the plist, macOS uses its internal default
  if [[ -z "$output" ]]; then
    echo "$key = [Not Set / Using OS Default]"
  else
    echo "$key = $output"
  fi
}

echo -e "\n--- General UI/UX ---"
read_default "NSGlobalDomain" "NSNavPanelExpandedStateForSaveMode"
read_default "NSGlobalDomain" "NSNavPanelExpandedStateForSaveMode2"
read_default "NSGlobalDomain" "PMPrintingExpandedStateForPrint"
read_default "NSGlobalDomain" "PMPrintingExpandedStateForPrint2"
read_default "com.apple.menuextra.battery" "ShowPercent"
read_default "-globalDomain" "NSStatusItemSpacing" "-currentHost"

echo -e "\n--- Finder ---"
read_default "NSGlobalDomain" "AppleShowAllExtensions"
read_default "com.apple.finder" "AppleShowAllFiles"
read_default "com.apple.finder" "ShowStatusBar"
read_default "com.apple.finder" "ShowPathbar"
read_default "com.apple.finder" "CalculateAllSizes"
read_default "com.apple.finder" "_FXSortFoldersFirst"
read_default "com.apple.finder" "FXInfoPanesExpanded"

echo -e "\n--- Folders ---"
ls -lOd ~/Library | grep -q "hidden" && echo "~/Library = [Hidden]" || echo "~/Library = [Visible]"
ls -lOd /Volumes | grep -q "hidden" && echo "/Volumes = [Hidden]" || echo "/Volumes = [Visible]"

echo -e "\n--- Dock ---"
read_default "com.apple.dock" "autohide"
read_default "com.apple.dock" "show-process-indicators"
read_default "com.apple.dock" "launchanim"
read_default "com.apple.dock" "show-recents"
read_default "com.apple.dock" "no-bouncing"

echo -e "\n--- Energy Saving (pmset) ---"
echo "Battery (-b):"
pmset -b -g | grep -E "^ displaysleep|^ sleep" | awk '{$1=$1; print "  " $0}'
echo "Charger (-c):"
pmset -c -g | grep -E "^ displaysleep|^ sleep" | awk '{$1=$1; print "  " $0}'
echo ""