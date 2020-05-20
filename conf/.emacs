;;; Austin Bricker .emacs
;;; 2019-2020

;;; Setup packages
(require 'package)

;; Package list
(setq package-list '(evil
		     evil-commentary
		     evil-easymotion
		     evil-goggles
		     evil-leader
		     evil-org
		     evil-surround
		     evil-visualstar
		     key-chord
		     spacemacs-theme))

;; Automatically install missing packages
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
;;;

;;; Load packages
(require 'evil-commentary)
(evil-commentary-mode t)

(require 'evil-leader)
(global-evil-leader-mode 1)

(require 'evil-goggles)
(evil-goggles-mode t)

(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil-visualstar)
(global-evil-visualstar-mode 1)

(require 'evil)
(evil-mode t)

;; Needs to be required after evil
(require 'evil-easymotion)

(require 'key-chord)
(key-chord-mode t)

(load-theme 'spacemacs-dark t)
;;;

;;; Set custom Vim keybindings
;; jk is escape
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; Set evil leader to be ,
(evil-leader/set-leader ",")

;; Remap B/E to
(define-key evil-normal-state-map (kbd "B") 'evil-first-non-blank)
(define-key evil-normal-state-map (kbd "E") 'evil-end-of-line)

;; Jump between bracket pairs with Tab
;; (define-key evil-normal-state-map (kbd "<tab>") 'evil-jump-item)

;; J/K changes tabs (buffers)
(define-key evil-normal-state-map (kbd "J") 'previous-buffer)
(define-key evil-normal-state-map (kbd "K") 'next-buffer)

;; Replace typing :noh
(evil-leader/set-key "<SPC>" 'evil-ex-nohighlight)

;; Set Y to yank to end of line
(define-key evil-normal-state-map (kbd "Y") (kbd "y$"))

;; Center on cursor after jumping to top/bottom of screen
(define-key evil-normal-state-map (kbd "H")
  (lambda()
    (interactive)
    (call-interactively 'evil-window-top)
    (call-interactively 'evil-scroll-line-to-center)))

(define-key evil-normal-state-map (kbd "L")
  (lambda()
    (interactive)
    (call-interactively 'evil-window-bottom)
    (call-interactively 'evil-scroll-line-to-center)))

(evilem-default-keybindings "SPC")
;;;

;;; General settings
(tool-bar-mode 0) ;; Turn off terrible GUI buttons
(toggle-frame-maximized) ;; Start with window maximized
(global-display-line-numbers-mode 1) ;; Show line numbers
;;;

;;; Org Mode settings
(setq org-todo-keywords '((sequence "TODO" "IN PROGRESS" "IDEA" "HIATUS" "|" "DONE")))
(setq org-log-done 'time)
;;;
