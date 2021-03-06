source ~/.profile

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# ZSH settings
ZSH_THEME="luciano"
plugins=(
  git vi-mode fzf
  #zsh-autosuggestions zsh-syntax-highlighting
  #node nvm yarn kubectl
)

export ZSH=/Users/luciano/.oh-my-zsh # On Arch, run `sudo ln -s /home /Users`
source $ZSH/oh-my-zsh.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -e "${HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" && source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Setting the $PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH # Rust/Cargo
export PATH="$PATH:$(yarn global bin)" # Yarn global packages
export PATH=$PATH:$(go env GOPATH)/bin # Go binaries
export PATH="$PATH:$HOME/flutter/bin" # Flutter

# Other exports
export FZF_BASE=/usr/bin/fzf
export ANSIBLE_NOCOWS=1 # No cowsay in Ansible, because I'm boring af

# Change indicator for vi-mode
export MODE_INDICATOR="%{$fg_bold[red]%}<< %{$fg[red]%}VIM KEYS ACTIVATED >>%{$reset_color%}"

# NVM config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Enable the fuck command
eval $(thefuck --alias)

# Load generalrc latest, to Oh My ZSH commands
source ~/.generalrc

