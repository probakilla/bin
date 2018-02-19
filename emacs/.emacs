
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; ==== CODDING STYLE ====
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'fill-column-indicator)

(setq fci-rule-color "pink")
(setq fci-rule-column 80)

(setq c-default-style "linux"
	c-basic-offset 4)

;; ==== CODDING STYLE ====

;; ==== CUSTOM BINDS ====
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "M-*") 'pop-tag-mark)
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
    (ac-clang auto-complete-sage auto-complete-pcmp auto-complete-nxml auto-complete-clang-async bison-mode auto-correct auto-complete-exuberant-ctags auto-complete-clang auto-complete-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
