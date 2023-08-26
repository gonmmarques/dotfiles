#!/usr/bin/env bash

# Install or update brew
cd ~
which -s brew
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo "Installing Brew"
else
    echo "Updating Brew"
fi


brew tap caskroom/cask

# Install dependencies
brew install awscli
brew install bash-completion
brew install corkscrew
brew install --cask corretto11
brew install --cask corretto17
brew install docker			
brew install docker-compose
brew install exa
brew install fzf
brew install gh
brew install git
brew install git-crypt
brew install git-extras
brew install git-secrets
brew install gnu-getopt
brew install gnu-sed
brew install gnupg
brew install go
brew install gradle
brew install grip
brew install helm
brew install hstr
brew install int128/kubelogin/kubelogin
brew install jenv
brew install jmeter
brew install jq
brew install k9s
brew install kotlin
brew install krew
brew install kube-ps1
brew install kubectl
brew install kubectx
brew install kubie
brew install kustomize
brew install maven
brew install mas
brew install minikube
brew install nano
brew install newman
brew install node
brew install openjdk
brew install pinentry-mac
brew install pkg-config
brew install robscott/tap/kube-capacity
brew install python3
brew install ruby
brew install unrar
brew install watch
brew install wget
brew install zplug
brew install zsh
brew install zsh-completions
brew install zsh-syntax-highlighting

# Install GUI apps
brew cask install iterm2
brew cask install postman
#brew cask install intellij-idea
brew cask install firefox
brew cask install visual-studio-code
brew cask install spotify
brew cask install macpass
brew cask install slack
brew cask install spectacle
brew install --cask rectangle
 

# Print the installed packages and their dependencies
brew leaves | xargs brew deps --installed --for-each | sed "s/^.*:/$(tput setaf 4)&$(tput sgr0)/"


# Remove outdated versions from the cellar.
brew cleanup