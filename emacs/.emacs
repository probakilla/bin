;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; p-ins ->
;; ==== Packages installés ====
;; Coding Style :
;;      fill-column-indicator
;; Auto Completion :
;;      auto-complete
;;      ac-c-header
;;      ac-clang
;;      ac-etags
;;      ac-ispell
;;      auto-complete-auctex
;;      auto-complete-c-headers
;;      auto-complete-clang
;;      auto-comlete-exuberant-ctags
;;      auto-complete-clang-async
;; Curseur Multiples :
;;      ace-jump-mode
;;      multiple-cursor
;;      dash
;;      ace-mc (a besoin des 3 derniers)
;;              C-)   -> Ajouter plusieur curseurs
;;              C-M-) -> Ajouter un curseur
;; LateX :
;;      auctex
;; Misc :
;;      auto-correct
;;      auto-package-update
;;      bash-completion
;;      autopair
;;      srefactor

;; Initializing emacs packages.
(package-initialize)

;; ==== INITIALIZE PACKAGE ARCHIVES ====
;; Initializing Melpa.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (srefactor ac-clang auto-complete-sage auto-complete-pcmp \\
               auto-complete-nxml auto-complete-clang-async bison-mode \\
               auto-correct auto-complete-exuberant-ctags auto-complete-clang\\
               auto-complete-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ==== INITIALIZE PACKAGE ARCHIVES ====

;; ==== PACKAGE LOAD MANAGEMENT ====
;; fill-column-indicator package - auto launch.
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'fill-column-indicator)

;; Bash completion for commmands ('M-x') - auto lauch.
(require 'bash-completion)
(bash-completion-setup)

;; Buffer completion for C/C++ header files
(require 'auto-complete-c-headers)
(add-to-list 'ac-sources 'ac-source-c-headers)

;; Clang auto-complete
(add-to-list 'load-path (concat "$(HOME)/.emacs.d/elpa" "AC"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat "$(HOME)/.emacs.d/elpa" "AC/ac-dict"))

(require 'auto-complete-clang)

(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
(define-key ac-mode-map  [(control tab)] 'auto-complete)
(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  ;; (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  ;; (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)
(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
 /usr/include/c++/4.6
 /usr/include/c++/4.6/x86_64-linux-gnu/.
 /usr/include/c++/4.6/backward
 /usr/lib/gcc/x86_64-linux-gnu/4.6.1/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/4.6.1/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include
"
               )))
;; Clang auto-complete end

;; Etags auto-complete
(custom-set-variables
 '(ac-etags-requires 1))
(eval-after-load "etags"
  '(progn
     (ac-etags-setup)))
(defun my/c-mode-common-hook ()
  (add-to-list 'ac-sources 'ac-source-etags))
(add-hook 'c-mode-common-hook 'my/c-mode-common-hook)

;; ispell auto-complete
;; Completion words longer than 4 characters
(custom-set-variables
 '(ac-ispell-requires 4)
 '(ac-ispell-fuzzy-limit 4))
(eval-after-load "auto-complete"
  '(progn
     (ac-ispell-setup)))
(add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
(add-hook 'mail-mode-hook 'ac-ispell-ac-setup)

;; Auto pair chars like parenthesis or braces - auto launch.
(require 'autopair)
(autopair-global-mode)

;; Refactoring C/C++ and lisp.
(require 'srefactor)
(require 'srefactor-lisp)

;; Auto-update
(add-to-list 'load-path "/path/to/auto-package-update")
(require 'auto-package-update)

;; OPTIONAL: ADD IT ONLY IF YOU USE C/C++.
(semantic-mode 1) ;; -> this is optional for Lisp

;; ==== PACKAGE LOAD MANAGEMENT ====

;; ==== CODING STYLE ====
;; Color and column number for full-column-indicator.
(setq fci-rule-color "pink")
(setq fci-rule-column 80)
;; Indentation and style for braces (if, then, else, while etc...)
(setq c-default-style "linux"
      c-basic-offset 2)
;; Starting with auto-complete-mode
(ac-config-default)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'c++-mode)
;; Stating with fci-mode
(define-globalized-minor-mode my-global-fci-mode fci-mode turn-on-fci-mode)
(my-global-fci-mode 1)
;; ==== CODING STYLE ====

;; ==== CUSTOM BINDS ====
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
;; Return before M-.
(global-set-key (kbd "M-*") 'pop-tag-mark)
;; Multiples curors.
(global-set-key (kbd "C-)") 'ace-mc-multiple-cursors)
(global-set-key (kbd "C-M-)") 'ace-mc-add-single-cursor)
;; Tags
(global-set-key (kbd "C-e") 'visit-tags-table)
;; Refactor binds.
(define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
(global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
(global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
(global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)
;; ==== CUSTOM BINDS ====
