source ~/.generalrc

function copy() { cat $1 | pbcopy }

# Listing commands
alias lls="colorls --sort-dirs --long --git-status"
alias lss="colorls --sort-dirs --report --git-status"
alias lsss="colorls --tree"

# Custom
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias copysshkey="cat ~/.ssh/id_rsa.pub| pbcopy"
alias copyip="curl http://ipecho.net/plain | pbcopy"
alias composer="~/.bin/composer.phar"

# Folders
alias cdh="cd ~"
alias cddocs="cd ~/Documents"
alias cdg="cd ~/Documents/git"
alias cdgit="cd ~/Documents/Git"
alias cdprop="cd ~/Documents/proposals"
alias cddoc="cd ~/Documents"
alias cdd="cd ~/Desktop"
alias cddown="cd ~/Downloads"
alias cdb="cd ~/Documents/git/breda"
alias cdnotes="cd ~/Documents/Git/notulen"
alias cdbcw="cd ~/Documents/git/bytecode-website"
alias cddep="cd ~/Documents/git/deployment"
alias cdinf="cd ~/Documents/git/infrastructure"


#export PATH=/Applications/MAMP/bin/php/php7.1.8/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH
source ~/.profile

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/lucianonooijen/.oh-my-zsh

# Make mtr work
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/lucianonooijen/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/lucianonooijen/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/lucianonooijen/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/lucianonooijen/node_modules/tabtab/.completions/sls.zsh

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Spaceship ZSH settings
SPACESHIP_PROMPT_ADD_NEWLINE="false"
SPACESHIP_DIR_COLOR="blue"
SPACESHIP_CHAR_COLOR_SUCCESS="green"
SPACESHIP_CHAR_SYMBOL="✏️ 👉  "
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_HOST_PREFIX="at "
SPACESHIP_DIR_PREFIX="in "
SPACESHIP_PACKAGE_COLOR="yellow"
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_COLOR="yellow"

# colorls
source $(dirname $(gem which colorls))/tab_complete.sh


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/terraform/0.11.7/bin/terraform terraform

export PAGER="most"
