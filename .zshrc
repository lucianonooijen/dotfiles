source ~/.generalrc
source ~/.profile

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

export ZSH=/Users/luciano/.oh-my-zsh # On Arch, run `sudo ln -s /home /Users`
export FZF_BASE=/usr/bin/fzf

eval $(thefuck --alias)

ZSH_THEME="luciano"

plugins=(
  git
  vi-mode
  fzf
  #node
  #nvm
  #yarn
  kubectl
  #zsh-autosuggestions
  #zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

test -e "${HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" && source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

