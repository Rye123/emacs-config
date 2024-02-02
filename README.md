# emacs-config

Custom Emacs config.

## Setup
```bash
make
```

### LSPs
Default language servers for the following languages can be installed:

#### C (`ccls`)
```bash
apt install ccls
```
(More info [here](https://github.com/MaskRay/ccls/wiki/Build))

#### Python (`jedi-language-server`)
```bash
python3 -m ensurepip
python3 -m pip install jedi-language-server
```

#### Go (`gopls`)
```bash
go install golang.org/x/tools/gopls@latest
```

#### Bash (`bash-language-server`)
```bash
npm i -g bash-language-server
```
