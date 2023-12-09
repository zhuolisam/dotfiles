# For ARM-based
export PATH="/opt/homebrew/bin:$PATH"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# enable completion system
autoload compinit

# initialize all completions on #fpath but ignore (-i) all insecure files and directories
compinit -i

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
	kubectl
	# git
)

source $ZSH/oh-my-zsh.sh

#Load NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# use nvm
# source $(brew --prefix nvm) nvm

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
# export PATH="/Users/sli/.rd/bin:$PATH"

#Add VS Code to path
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Brew4.0 changed from Git to JSON, will download from formulae.brew.sh/api/formula.jws.json
# So we have to say don't use the new API, but used old brew/core and crew/cast
export HOMEBREW_NO_INSTALL_FROM_API=1

## Load Python
# All these are to setup pyenv, can be found in github.com/pyenv/pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# This to activate pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# oh-my-zsh kubectl plugins
source <(kubectl completion zsh)

# Load terraform-autodocs
# terraform-docs completion zsh > /usr/local/share/zsh/site-functions/_terraform-docs

# aliases
alias gb='git branch | cat'
alias ll='ls -la'

# Load GO
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin

# use starship theme (needs to be at the end)
eval "$(starship init zsh)"
