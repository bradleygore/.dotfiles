# other custom stuff can be found (and is auto-loaded) ~/.omzsh/custom
ZSH_CUSTOM=${HOME}/.omzsh/custom

# Add brew to path
eval "$($(which brew) shellenv)"
# tell nvm plugin where nvm is installed (via homebrew)
export NVM_DIR=$(brew --prefix nvm)
NVM_HOMEBREW=$(brew --prefix nvm)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# We'll use the nvm plugin, but want it to lazy-load
zstyle ':omz:plugins:nvm' lazy yes

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster-custom"

# since we have customized agnoster, we don't need prompt ending of <aws:username> that aws plugin generates 
SHOW_AWS_PROMPT=false 

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aws
  docker
  git
  git-extras
  nvm
  minikube
)

source $ZSH/oh-my-zsh.sh
if [[ -d ~/.oh-my-zsh-nab/custom ]]; then
  for f in ~/.oh-my-zsh-nab/custom/*.zsh
  do
      [ -e "$f" ] || continue
      source "$f"
  done
  unset f
fi

# if there are local ~/.oh-my-zsh/custom/*.zsh files let's source those
# so that this set can be overlaid by users' local ones
if [[ -d ~/.oh-my-zsh/custom ]]; then
  for f in ~/.oh-my-zsh/custom/*.zsh
  do
    [ -e "$f" ] || continue
    source "$f"
  done
  unset f
fi

# func to run any time PWD changes (see https://zsh.sourceforge.io/Doc/Release/Functions.html)
chpwd() {
  if [ -f .nvmrc ]
  then
    nvm use --silent
  fi
}

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='$HOME/bin/mate -w'
else
  export EDITOR='mvim'
fi

# Python
export PATH=/Library/Frameworks/Python.framework/Versions/3.11/bin:$PATH
alias python=python3

# GO Path
export GOPATH=$HOME/go/bin
export GOBIN=$HOME/go/bin # where to install global tooling
# go modules we want to promote to globally available
export PATH=$GOROOT/bin:$GOPATH:$PATH
# govm (Go Version Manager)
export PATH="$HOME/.govm/shim:$PATH"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

alias zshconfig="vi ~/.zshrc"

# autocompletion for kubectl
source <(kubectl completion zsh)

