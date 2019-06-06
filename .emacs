;; Austin Bricker .emacs

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Add other package repository
(setq package-archives '("melpa" . "http://melpa.org/packages/"))

;; Load packages
;; Add to path
(add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "~/.emacs.d/evil-surround")
(add-to-list 'load-path "~/.emacs.d/evil-commentary")
(add-to-list 'load-path "~/.emacs.d/evil-snipe")
(add-to-list 'load-path "~/.emacs.d/key-chord")

;; Require
(require 'evil)
(require 'evil-surround)
(require 'evil-commentary)
(require 'evil-snipe)
(require 'key-chord)
(require 'org)

;; Activate
(evil-mode 1)
(evil-surround-mode 1)
(evil-commentary-mode 1)
(evil-snipe-mode 1)
(key-chord-mode 1)

;; Evil mode keybindings
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(tool-bar-mode 0) ;; Turn off terrible GUI buttons
(toggle-frame-maximized) ;; Start with window maximized
(global-display-line-numbers-mode 1) ;; Show line numbers

;; Org Mode settings
(setq org-log-done t)
