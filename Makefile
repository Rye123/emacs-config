all:
	mkdir -p ~/.config/emacs
	cp ./early-init.el ~/.config/emacs/early-init.el
	cp ./init.el ~/.config/emacs/init.el
	mkdir -p ~/org
	mkdir -p ~/.backups
