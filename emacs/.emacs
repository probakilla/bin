
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; p-ins ->
;; ==== Packages installés ====
;; Coding Style :
;; 	fill-column-indicator
;; Auto Completion :
;; 	auto-complete
;; 	ac-c-headers
;; 	ac-clang
;;	ac-etags
;;	ac-ispell
;;	auto-complete-auctex
;;	auto-complete-c-headers
;;	auto-complete-clang
;;	auto-comlete-exuberant-ctags
;;	auto-complete-clang-async
;; Curseur Multiples :
;;	ace-jump-mode
;;	multiple-cursor
;;	dash
;;	ace-mc (a besoin des 3 derniers)
;;		C-)   -> Ajouter plusieur curseurs
;;		C-M-) -> Ajouter un curseur
;; LateX :
;;	auctex
;; Misc :
;;	auto-correct
;;	auto-package-update
;;	bash-completion
;;	autopair

;; ==== CODDING STYLE ====
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path (expand-file-name "~/elisp"))
(require 'fill-column-indicator)
(require 'auto-complete-auctex)
(require 'auto-complete-c-headers)
(add-to-list 'ac-sources 'ac-source-c-headers)
(require 'auto-complete-exuberant-ctags)
(ac-exuberant-ctags-setup)
(require 'auto-package-update)
(load "auctex.el" nil t t)

(setq fci-rule-color "pink")
(setq fci-rule-column 80)

(setq c-default-style "linux"
	c-basic-offset 4)

(require 'autopair)
(autopair-global-mode)

(autoload 'bash-completion-dynamic-complete 
   "bash-completion"
   "BASH completion hook")
 (add-hook 'shell-dynamic-complete-functions
	   'bash-completion-dynamic-complete)

(add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
(add-hook 'mail-mode-hook 'ac-ispell-ac-setup)

(add-hook
 'org-mode-hook
 (lambda ()
   setq auto-correct-predicate
    (lambda () (not (org-in-src-block-p)))))
;; ==== CODDING STYLE ====

;; ==== MISC ====
(require 'bash-completion)
(bash-completion-setup)
;; ==== MISC ====

;; ==== CUSTOM BINDS ====
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
;; Return before M-.
(global-set-key (kbd "M-*") 'pop-tag-mark)
;; Multiples curors
(global-set-key (kbd "C-)") 'ace-mc-multiple-cursors)
(global-set-key (kbd "C-M-)") 'ace-mc-add-single-cursor)
;; ==== CUSTOM BINDS ====


;; ==== PACKAGES ====
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize) 
;; Starting with auto-complete-mode
(ac-config-default)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'c++-mode)
;; Stating with fci-mode
(define-globalized-minor-mode my-global-fci-mode fci-mode turn-on-fci-mode)
(my-global-fci-mode 1)
;; ==== PACKAGES ====
	
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (bash-completion auto-package-update auto-complete-auctex ac-ispell ac-etags ac-clang auto-complete-sage auto-complete-pcmp auto-complete-nxml auto-complete-clang-async bison-mode auto-correct auto-complete-exuberant-ctags auto-complete-clang auto-complete-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
