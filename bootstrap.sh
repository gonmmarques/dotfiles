#!/usr/bin/env bash


# Installing brew packages and some GUI apps
source brew/brew.sh

# Configuring zsh as the default shell
chsh -s /bin/zsh

# Configuring macOS defaults
source macos/defaults.sh

# Configuring dock with GUI apps
source macos/dock.sh