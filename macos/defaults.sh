#!/usr/bin/env bash
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Menu bar: show battery percentage
defaults write com.apple.menuextra.battery ShowPercent YES

# Menu bar: set status item spacing
# see https://github.com/jessesquires/jessesquires.com/blob/master/_posts/2023-12-16-macbook-notch-and-menu-bar-fixes.md
defaults -currentHost write -globalDomain NSStatusItemSpacing -int 4
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 6

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: calculate all sizes in list view
defaults write com.apple.finder CalculateAllSizes -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict OpenWith -bool true


###############################################################################
# Dock                                                                        #
###############################################################################

# Dock: autohide disabled by default
defaults write com.apple.dock autohide -bool false

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Don't show recently used applications in the Dock
defaults write com.apple.dock show-recents -bool false

# No bouncing icons
defaults write com.apple.dock no-bouncing -bool true


###############################################################################
# Energy saving                                                               #
###############################################################################

# Sleep the display after 10 minutes
sudo pmset -a displaysleep 10

# Disable machine sleep while charging
sudo pmset -c sleep 0

# Set machine sleep to 15 minutes on battery
sudo pmset -b sleep 15