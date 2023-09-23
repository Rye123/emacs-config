all:
	mkdir -p ~/.config/emacs
	cp ./init.el ~/.config/emacs/init.el

py-lsp:
	python3 -m ensurepip
	python3 -m pip install jedi-language-server

go-lsp:
	go install golang.org/x/tools/gopls@latest

bash-lsp:
	npm i -g bash-language-server
