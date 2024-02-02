(require 'package)
(unless package-archive-contents
  (package-refresh-contents t))
(package-install-selected-packages 'noconfirm)

;; Display Customisation
(load-theme 'manoj-dark t)
(set-face-attribute 'default nil :font "Comic Mono") ; default fontface
(tool-bar-mode -1) ; disable toolbar
(global-display-line-numbers-mode t) ;; line numbering
(electric-pair-mode t) ; pair parentheses

;; Package Configuration
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
(vertico-mode t) ; completing by narrowing
(setq eat-kill-buffer-on-exit t)
(setq eat-enable-mouse t)
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)
;; (add-hook 'LaTeX-mode-map #'LaTeX-math-mode) ; latex math support

;; Directories Used
(setq org-agenda-files '("~/org"))
(setq backup-directory-alist `(("/" . "~/.backups")))

;; Hooks
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook #'eglot-ensure)
(add-hook 'prog-mode-hook #'flymake-mode)
(add-hook 'prog-mode-hook #'diff-hl-mode)


;; Keybinds
(global-set-key (kbd "C-c g") #'magit-status)
(global-set-key (kbd "C-c z") #'avy-goto-word-1)
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; Miscellaneous options

;; Custom Start Screen
(defun start-scr()
  (org-agenda nil "n"))
(add-hook 'after-init-hook #'start-scr)

(setq inhibit-startup-screen t
      initial-buffer-choice nil)


;;; init.el ends here

