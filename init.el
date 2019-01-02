(when (member "SF Mono" (font-family-list))
  (set-face-attribute 'default nil :font "SF Mono-14"))
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode)

;; Package configs
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


;; (use-package benchmark-init
;;   :ensure t
;;   :config
;;   ;; To disable collection of benchmark data after init is done.
;;   (add-hook 'after-init-hook 'benchmark-init/deactivate))

;; Vim mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) 
  (setq evil-want-keybinding nil)
  (setq evil-toggle-key "")
  (setq evil-search-module 'evil-search)
  :config
  (evil-mode 1)
;;  (setcdr evil-insert-state-map nil)
  )

;;(use-package evil-collection
;;  :after evil
;;  :ensure t
;;  ;;:custom (evil-collection-setup-minibuffer t)
;;  :config
;;  (evil-collection-init))

(use-package evil-numbers
  :after evil
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
  ;; (define-key evil-normal-state-map (kbd "C-S-A") 'evil-numbers/dec-at-pt)
)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-vibrant t))

(use-package json-mode
  :ensure t)

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
)

(use-package highlight-indentation
  :ensure t
  :config
  (highlight-indentation-mode 1)
)

(use-package fzf
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-p") 'fzf))

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))
 

;; NeoTree
;; (use-package neotree
;;   :ensure t)

;; (load-theme 'tango-dark)

;; Show matching paren
(setq show-paren-delay 0)
(show-paren-mode 1)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1)

;; Disable backup files
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(setq standard-indent 4)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(xterm-mouse-mode 1)

(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "|") 'split-window-horizontally)
(define-key evil-normal-state-map (kbd "_") 'split-window-vertically)
(define-key evil-normal-state-map (kbd "SPC b b") 'buffer-menu)
(define-key evil-normal-state-map (kbd "SPC SPC") 'evil-ex-nohighlight)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-collection-setup-minibuffer t t)
 '(package-selected-packages
   (quote
    (nord-theme use-package json-mode highlight-indentation fzf evil-numbers evil-collection auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
