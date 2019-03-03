backup:
	mkdir ~/dotfiles_backup
	(ls ~/bashrc && mv ~/.bashrc ~/dotfiles_backup) || echo 'bashrc not backupped'
	(ls ~/.config && mv ~/.config ~/dotfiles_backup) || echo 'config dir not backupped'
	(ls ~/.editorconfig && mv ~/.editorconfig ~/dotfiles_backup) || echo 'editorconfig not backupped'
	(ls ~/.eslintrc && mv ~/.eslintrc ~/dotfiles_backup) || echo 'eslintrc not backupped'
	(ls ~/.generalrc && mv ~/.generalrc ~/dotfiles_backup) || echo 'generalrc not backupped'
	(ls ~/.mozilla && mv ~/.mozilla ~/dotfiles_backup) || echo '.mozilla not backupped'
	(ls ~/.oh-my-zsh && mv ~/.oh-my-zsh ~/dotfiles_backup) || echo 'oh-my-zsh not backupped'
	(ls ~/.profile && mv ~/.profile ~/dotfiles_backup) || echo 'profile not backupped'
	(ls ~/.scripts && mv ~/.scripts ~/dotfiles_backup) || echo 'scripts not backupped'
	(ls ~/.shortcuts && mv ~/.shortcuts ~/dotfiles_backup) || echo 'shortcuts not backupped'
	(ls ~/.tmux.conf && mv ~/.tmux.conf ~/dotfiles_backup) || echo 'tmux conf not backupped'
	(ls ~/.vim && mv ~/.vim ~/dotfiles_backup) || echo 'vim dir not backupped'
	(ls ~/.vimrc && mv ~/.vimrc ~/dotfiles_backup) || echo 'vimrc not backupped'
	(ls ~/.Xdefaults && mv ~/.Xdefaults ~/dotfiles_backup) || echo 'xdefaults not backupped'
	(ls ~/.xinitrc && mv ~/.xinitrc ~/dotfiles_backup) || echo 'xinitrc not backupped'
	(ls ~/.xprofile && mv ~/.xprofile ~/dotfiles_backup) || echo 'xprofile not backupped'
	(ls ~/.Xresources && mv ~/.Xresources ~/dotfiles_backup) || echo 'xresources not backupped'
	(ls ~/.zprofile && mv ~/.zprofile ~/dotfiles_backup) || echo 'zprofile not backupped'
	(ls ~/.zshrc && mv ~/.zshrc ~/dotfiles_backup) || echo 'zshrc not backupped'

link:
	ln -sv $(pwd)/.bashrc $HOME
	ln -sv $(pwd)/.config $HOME
	ln -sv $(pwd)/.editorconfig $HOME
	ln -sv $(pwd)/.eslintrc $HOME
	ln -sv $(pwd)/.generalrc $HOME
	ln -sv $(pwd)/.mozilla $HOME
	ln -sv $(pwd)/.oh-my-zsh $HOME
	ln -sv $(pwd)/.profile $HOME
	ln -sv $(pwd)/.scripts $HOME
	ln -sv $(pwd)/.shortcuts $HOME
	ln -sv $(pwd)/.tmux.conf $HOME
	ln -sv $(pwd)/.vim $HOME
	ln -sv $(pwd)/.vimrc $HOME
	ln -sv $(pwd)/.Xdefaults $HOME
	ln -sv $(pwd)/.xinitrc $HOME
	ln -sv $(pwd)/.xprofile $HOME
	ln -sv $(pwd)/.Xresources $HOME
	ln -sv $(pwd)/.zprofile $HOME
	ln -sv $(pwd)/.zshrc $HOME
