# ------------------------------------------------------------------------------
# Optional profiling
# ------------------------------------------------------------------------------
# Uncomment temporarily when profiling startup:
#zmodload zsh/zprof


# ------------------------------------------------------------------------------
# Oh My Zsh performance settings
# ------------------------------------------------------------------------------
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
ZSH_DISABLE_COMPFIX="true"

# ------------------------------------------------------------------------------
# Basic configuration
# ------------------------------------------------------------------------------
# Homebrew
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Locale
#export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Editor 
export EDITOR="code"
export VISUAL="$EDITOR"
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ------------------------------------------------------------------------------
# History
# ------------------------------------------------------------------------------
export HISTSIZE="32768"
export HISTFILESIZE=$HISTSIZE
export HISTFILE="$HOME/.zsh_history"

# HISTCONTROL is mainly a Bash setting; kept for compatibility.
export HISTCONTROL="ignoreboth"

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt HIST_NO_STORE

# ------------------------------------------------------------------------------
# PATH
# ------------------------------------------------------------------------------
# Remove duplicate entries in the path
typeset -U path PATH

# Personal commands and legacy local commands
#export PATH="$HOME/bin:/usr/local/bin:$PATH"
# Kubernetes plugins
export KREW_ROOT="${KREW_ROOT:-$HOME/.krew}"
export PATH="$KREW_ROOT/bin:$PATH"
# jenv
export PATH="$HOME/.jenv/bin:$PATH"
# Go tools
export PATH="$HOME/go/bin:$PATH"
# asdf - Ruby
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# User-specific executables - check via ls -la ~/.local/bin 
export PATH="$HOME/.local/bin:$PATH"

# ------------------------------------------------------------------------------
# Environment variables
# ------------------------------------------------------------------------------
# kubectx & kubens
export KUBECTX_IGNORE_FZF=1
export KUBECTX_CURRENT_FGCOLOR=$(tput setaf 6) # blue text
export KUBECTX_CURRENT_BGCOLOR=$(tput setab 0) # white background


# Load private environment variables if available.
if [[ -r "$HOME/.config/private/env.zsh" ]]; then
  source "$HOME/.config/private/env.zsh"
fi

# ------------------------------------------------------------------------------
# Completion paths and settings
# ------------------------------------------------------------------------------
# Remove duplicate PATH and completion entries.
typeset -U path PATH fpath

# Put custom completion directories before Oh My Zsh initializes completion.
fpath=(
  "$HOME/.zsh/completions"
  $fpath
)

zstyle ':completion:*:*:kubectx:*' script "$HOME/.zsh/kubectx.bash"
zstyle ':completion:*:*:kubens:*' script "$HOME/.zsh/kubens.zsh"

# Do not call compinit manually here.
# Oh My Zsh initializes it once.

# ------------------------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------------------------
#export ZSH_COMPDUMP="$HOME/.zcompdump"
export ZSH_COMPDUMP="$HOME/.zcompdump-$ZSH_VERSION"
export ZSH="$HOME/.oh-my-zsh"
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dracula"

plugins=(docker git jenv golang z kubectl kube-ps1 zsh-syntax-highlighting
  #mvn
  #git-extras
  #aws
  #zsh-nvm
  #docker-compose
  #sudo
)

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"

source "$ZSH/oh-my-zsh.sh"
_kube_ps1_prompt_update

# ------------------------------------------------------------------------------
# Aliases and key bindings
# ------------------------------------------------------------------------------
# Override mvn plugin alias
#alias mvn="mvn"

# History search
alias hh="hstr"
export HSTR_CONFIG="hicolor"
bindkey -s "\C-r" "\C-a hstr -- \C-j"

# File listing and viewing
alias l="eza -l"
alias ls="eza -la"
alias lt="eza -l --tree -L 2"
alias tree="eza -l --tree -L 2"
alias tree-md="eza -l --tree -L 3 --no-permissions --no-user --no-filesize --no-time"
alias cat="bat"

# Navigation and shell configuration
alias "~"="cd ~"
alias zshreload='exec zsh'
alias zshconfig="code ~/.zshrc"
alias zshhistory="code ~/.zsh_history"

export GPG_TTY=$(tty)

# System
alias hosts="sudo $EDITOR /etc/hosts"

# SSH & GPG
alias copyssh-github="pbcopy < ~/.ssh/id_ed25519_githubcom.pub && echo 'SSH GitHub.com public key copied to clipboard.'"
#alias copygpg="gpg --armor --export <your-email-here>| pbcopy | echo 'GPG Public key copied to clipboard.'"


PROMPT='$(kube_ps1)'$PROMPT

# ------------------------------------------------------------------------------
# Optional profiling output
# ------------------------------------------------------------------------------

# Uncomment temporarily when profiling startup:
#zprof