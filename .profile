#!/bin/sh
# Profile file. Runs on login.
# variables and default programs:
# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"
export EDITOR="nvim"
export TERMINAL="st"
# Link handler is set as the $BROWSER for use with urlscan.
# Set your real browser in $TRUEBROWSER.
export BROWSER="linkhandler"
export TRUEBROWSER="firefox"
# export READER="zathura"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export REFER="$HOME/.referbib"
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export TERM=xterm-256color

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;36;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

# Fuzzy file finder
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git --exclude node_modules --follow"
export FZF_DEFAULT_OPTS="--color=16 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# Other exports
export FZF_BASE=/usr/bin/fzf
export ANSIBLE_NOCOWS=1 # No cowsay in Ansible, because I'm boring af
