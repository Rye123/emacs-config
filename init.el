;; Packages
(require 'package)
(add-to-list 'package-archives  '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(unless package-archive-contents  (package-refresh-contents t))

;; Display Customisation
(load-theme 'manoj-dark t)
(set-face-attribute 'default nil :font "Comic Mono") ; default fontface
(tool-bar-mode -1) ; disable toolbar
(global-display-line-numbers-mode t) ;; line numbering
(electric-pair-mode t) ; pair parentheses

;;; vertico: Completion framework
(unless (package-installed-p 'vertico)
  (package-install 'vertico))
(vertico-mode t) ; completing by narrowing

;;; company: Code Completion Suggestions framework
(unless (package-installed-p 'company)
  (package-install 'company))
(add-hook 'after-init-hook 'global-company-mode)

;;; eglot: LSP Support
(unless (package-installed-p 'eglot)
  (package-install 'eglot))
(add-hook 'prog-mode-hook #'eglot-ensure)

;;; flymake: Inline static analysis
(add-hook 'prog-mode-hook #'flymake-mode)

;;; magit: Git Client
(unless (package-installed-p 'magit)
  (package-install 'magit))
(global-set-key (kbd "C-c g") #'magit-status)

;;; diff-hl: Highlight VCS changes
(unless (package-installed-p 'diff-hl)
  (package-install 'diff-hl))
(add-hook 'prog-mode-hook #'diff-hl-mode)

;; Language Support
;; (unless (package-installed-p 'go-mode)
  ;; (package-install 'go-mode))

;;; Python Support
(unless (package-install-p 'python-mode)
  (package-install 'python-mode))

;;; JSON Support
;; (unless (package-installed-p 'json-mode)
  ;; (package-install 'json-mode))

;;; YAML Support
;; (unless (package-installed-p 'yaml-mode)
  ;; (package-install 'yaml-mode))

;;; LaTeX support
;; (unless (package-installed-p 'auctex)
  ;; (package-install 'auctex))
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)
;; (add-hook 'LaTeX-mode-map #'LaTeX-math-mode) ; latex math support

;;; Markdown support
(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))

;;; eat: In-Emacs Terminal Emulation
(unless (package-installed-p 'eat)
  (package-install 'eat))
(setq eat-kill-buffer-on-exit t)
(setq eat-enable-mouse t)

;;; avy: Jump to arbitrary positions
(unless (package-installed-p 'avy)
  (package-install 'avy))
(global-set-key (kbd "C-c z") #'avy-goto-word-1)

;; Miscellaneous options
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
(setq backup-directory-alist `(("/" . "~/.backups")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; Custom Start Screen
(defun start-scr()
  (org-agenda nil "n"))
(add-hook 'after-init-hook #'start-scr)

(setq inhibit-startup-screen t
      initial-buffer-choice nil)

;; Org-mode Shortcuts
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq org-agenda-files '("~/org"))


;;; init.el ends here
