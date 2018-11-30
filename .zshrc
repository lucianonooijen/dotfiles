source ~/.generalrc
source ~/.profile

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/luciano/.oh-my-zsh


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="luciano"

plugins=(
  git
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

export PAGER="most"
