(require 'package)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

; display customisation
(set-face-attribute 'default nil :font "Comic Mono")

;; nano-emacs
(add-to-list 'load-path "~/.config/emacs/nano-emacs")
(require 'nano-base-colors)
(require 'nano-faces)
(require 'nano-theme)
(require 'nano-theme-light)
(require 'nano-theme-dark)
(require 'nano-help)
(require 'nano-splash)
(require 'nano-modeline)
(require 'nano-layout)
(nano-theme-set-dark)
(nano-refresh-theme)

; package configuration
(setq-default major-mode
              (lambda () ; guess major mode from file name
                (unless buffer-file-name
                  (let ((buffer-file-name (buffer-name)))
                    (set-auto-mode)))))
(setq confirm-kill-emacs #'yes-or-no-p)
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(defalias 'yes-or-no #'y-or-n-p)
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)
(vertico-mode t)

; directories
(setq org-agenda-files '("~/org"))
(setq backup-directory-alist `(("/" . "~/.backups")))

; hooks
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook #'eglot-ensure)
(add-hook 'prog-mode-hook #'flymake-mode)
(add-hook 'prog-mode-hook #'diff-hl-mode)

; keybinds
(global-set-key (kbd "C-c g") #'magit-status)
(global-set-key (kbd "C-c z") #'avg-goto-word-1)
(global-set-key (kbd "C-c a") #'org-agenda)
