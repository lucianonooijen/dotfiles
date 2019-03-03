source ~/.generalrc
source ~/.profile
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

export ZSH=/Users/luciano/.oh-my-zsh
export FZF_BASE=/usr/bin/fzf

eval $(thefuck --alias)

ZSH_THEME="luciano"

plugins=(
  git
  #git-flow
  vi-mode
  fzf
  #node
  #nvm
  #yarn
  kubectl
  #minikube
  #helm
  #ansible
  zsh-autosuggestions
  #zsh-history-substring-search
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Set Spaceship ZSH as a prompt
# autoload -U promptinit; promptinit
# prompt spaceship

# Spaceship ZSH settings
# SPACESHIP_PROMPT_ADD_NEWLINE="false"
# SPACESHIP_DIR_COLOR="blue"
# SPACESHIP_CHAR_COLOR_SUCCESS="green"
# SPACESHIP_CHAR_SYMBOL="✏️ 👉  "
# SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
# SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
# SPACESHIP_HOST_PREFIX="at "
# SPACESHIP_DIR_PREFIX="in "
# SPACESHIP_PACKAGE_COLOR="yellow"
# SPACESHIP_USER_SHOW="always"
# SPACESHIP_USER_COLOR="yellow"

# colorls
# source $(dirname $(gem which colorls))/tab_complete.sh

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PAGER="most"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

