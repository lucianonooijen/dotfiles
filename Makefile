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
	ln -s $(pwd)/.bashrc $HOME
	ln -s $(pwd)/.config $HOME
	ln -s $(pwd)/.editorconfig $HOME
	ln -s $(pwd)/.eslintrc $HOME
	ln -s $(pwd)/.generalrc $HOME
	ln -s $(pwd)/.mozilla $HOME
	ln -s $(pwd)/.oh-my-zsh $HOME
	ln -s $(pwd)/.profile $HOME
	ln -s $(pwd)/.scripts $HOME
	ln -s $(pwd)/.shortcuts $HOME
	ln -s $(pwd)/.tmux.conf $HOME
	ln -s $(pwd)/.vim $HOME
	ln -s $(pwd)/.vimrc $HOME
	ln -s $(pwd)/.Xdefaults $HOME
	ln -s $(pwd)/.xinitrc $HOME
	ln -s $(pwd)/.xprofile $HOME
	ln -s $(pwd)/.Xresources $HOME
	ln -s $(pwd)/.zprofile $HOME
	ln -s $(pwd)/.zshrc $HOME
