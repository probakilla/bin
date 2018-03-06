;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; p-ins ->
;; ==== Packages installés ====
;; Auto Completion :
;;      auto-complete
;;      ac-c-header
;;      ac-clang
;;      ac-etags
;;      auto-complete-c-headers
;;      auto-complete-clang
;; Misc :
;;      auto-correct
;;      auto-package-update
;;      bash-completion
;;      autopair

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
 '(ac-etags-requires 1)
 '(ac-ispell-fuzzy-limit 4)
 '(ac-ispell-requires 4)
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(package-selected-packages
   (quote
    (ac-c-headers ac-clang auto-complete-sage auto-complete-pcmp \\ auto-complete-nxml auto-complete-clang-async bison-mode \\ auto-correct auto-complete-exuberant-ctags auto-complete-clang\\ auto-complete-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ==== INITIALIZE PACKAGE ARCHIVES ====

;; ==== PACKAGE LOAD MANAGEMENT ====
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Auto-complete for latex
(require 'auto-complete-latex)

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
(define-key ac-mode-map [(control tab)] 'auto-complete)
(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'latex-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)
;; Output of 'echo "" | g++ -v -x c++ -E -'
(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
 /usr/include/c++/6
 /usr/include/x86_64-linux-gnu/c++/6
 /usr/include/c++/6/backward
 /usr/lib/gcc/x86_64-linux-gnu/6/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/6/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include

"
               )))
;; Clang auto-complete end

;; Etags auto-complete
(eval-after-load "etags"
  '(progn
     (ac-etags-setup)))
(defun my/c-mode-common-hook ()
  (add-to-list 'ac-sources 'ac-source-etags))
(add-hook 'c-mode-common-hook 'my/c-mode-common-hook)

;; Auto pair chars like parenthesis or braces - auto launch.
(require 'autopair)
(autopair-global-mode)

;; Auto-update
(add-to-list 'load-path "/path/to/auto-package-update")
(require 'auto-package-update)

;; OPTIONAL: ADD IT ONLY IF YOU USE C/C++.
(semantic-mode 1) ;; -> this is optional for Lisp

;; Column-marker at startup
(require 'column-marker)
(add-hook 'c-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'latex-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'lisp-mode-hook (lambda () (interactive) (column-marker-1 80)))
(global-set-key [?\C-c ?m] 'column-marker-1)
;; ==== PACKAGE LOAD MANAGEMENT ====

;; ==== CODING STYLE ====
;; Indentation and style for braces (if, then, else, while etc...)
(setq c-default-style "linux"
      c-basic-offset 2)
;; Starting with auto-complete-mode
(ac-config-default)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'c++-mode)
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
(global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
(global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
(global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
(global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)
;; ==== CUSTOM BINDS ====
