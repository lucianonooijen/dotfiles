source ~/.generalrc
source ~/.profile

#export PATH=/Applications/MAMP/bin/php/php7.1.8/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="luciano"

plugins=(
  git
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
autoload -U +X bashcompinit && bashcompinit
