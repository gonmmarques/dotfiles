#!/usr/bin/env bash

# Install Homebrew if it is not available.
if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update


FORMULAE=(
    asdf
    awscli
    bash-completion
    bat
    corkscrew
    dockutil
    eza
    git
    gnu-getopt
    gnu-sed
    gnupg
    go
    grip
    helm
    homebank
    hstr
    jenv
    jq
    maven
    minikube
    nano
    node
    pinentry-mac
    pkgconf
    python@3.11
    protonpass/tap/pass-cli
    trash
    unbound
    watch
    wget
    zplug
    zsh
    zsh-completions
    zsh-syntax-highlighting
)

for formula in "${FORMULAE[@]}"; do
    brew list --formula "$formula" >/dev/null 2>&1 || brew install "$formula"
done

brew cleanup