
source ~/.iterm2_shell_integration.zsh

# Bash configuration
export LC_ALL=en_US.UTF-8
export EDITOR=nano
export HISTFILE=/Users/marqugon/.zsh_history
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';


# load git completions
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
# `compinit` scans $fpath, so do this before calling it.
fpath=(~/.zsh $fpath)
autoload -U compinit && compinit
zmodload -i zsh/complist

# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/marqugon/.oh-my-zsh"


# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dracula"


# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
 ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"


plugins=(
  git
  z
  zsh-syntax-highlighting
  sudo
  git-extras
  mvn
)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Workaround to override mvn plugin
alias mvn="mvn"

# Exa Configuration
alias l='exa -l'
alias ls='exa -la'
alias lt='exa -l --tree -L 2'
alias tree='exa -l --tree -L 2'


# Misc
alias hosts="sudo $EDITOR /etc/hosts"
alias copyssh="more ~/.ssh/id_rsa.pub | pbcopy | echo 'SSH Public key copied to clipboard.'"
alias copygpg="gpg --armor --export goncalo.marques@mercedes-benz.io| pbcopy | echo 'GPG Public key copied to clipboard.'"
alias reloadzsh="source ~/.zshrc"


# Path exports
export M2_HOME=/usr/local/Cellar/maven/3.5.4/libexec
export M2=$M2_HOME/bin
export PATH=$PATH:$M2_HOME/bin
export PATH="/usr/local/opt/node/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="/usr/local/opt/node@12/bin:$PATH"