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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes nil)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (cmake-mode xcscope clang-format flycheck-clang-tidy iedit ac-c-headers ac-clang auto-complete-sage auto-complete-pcmp \\ auto-complete-nxml auto-complete-clang-async bison-mode \\ auto-correct auto-complete-exuberant-ctags auto-complete-clang\\ auto-complete-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ==== INITIALIZE PACKAGE ARCHIVES ====

;; ==== PACKAGE LOAD MANAGEMENT ====
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'exec-path "~/.emacs.d/")
;; Auto pair chars like parenthesis or braces - auto launch.
(require 'autopair)
(autopair-global-mode)

;; Auto-update - auto launch
(add-to-list 'load-path "/path/to/auto-package-update")
(require 'auto-package-update)

;; Starting with auto-complete-mode
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '" /usr/include/c++/6
 /usr/include/x86_64-linux-gnu/c++/6
 /usr/include/c++/6/backward
 /usr/lib/gcc/x86_64-linux-gnu/6/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/6/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include
"))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; Turn on Semantic
(semantic-mode 1)
;; Function to suggest Semantic an auto complete
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;; Turn on ede mode
(global-ede-mode 1)
;; Tell ede where the project is
;; Reversi project
(ede-cpp-root-project "reversi"
                      :file "~/espaces/travail/reversi/code/src/main.cc"
                      :include-path '("../include/core"
                                      "../include/player" "../tests")
                      :system-include-path '("/usr/include/c++"))

(ede-cpp-root-project "editor"
                      :file "~/espaces/travail/archiloggj/code/build/Makefile"
                      :include-path '("../include/model")
                      :system-include-path '("/usr/include/c++"))



(require 'fill-column-indicator)
(setq fci-rule-column 80)
(setq fci-rule-width 1)
(setq fci-rule-color "red")

(add-to-list 'fci-mode 'latex-mode)

(require 'clang-format)
(setq clang-format-style-option "file")

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

;;(global-whitespace-mode 1)
;; ==== PACKAGE LOAD MANAGEMENT ====

;; ==== CODING STYLE ====
;; Indentation and style for braces (if, then, else, while etc...)
(setq c-default-style "linux"
      c-basic-offset 2)
;; ==== CODING STYLE ====

;; ==== CUSTOM BINDS ====
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
;; Return before M-.
(global-set-key (kbd "M-*") 'pop-tag-mark)
;; Tags
(global-set-key (kbd "C-e") 'visit-tags-table)
;; Iedit bind
(global-set-key (kbd "C-;") 'iedit-mode)
(global-set-key (kbd "C-c i") 'clang-format-region)
(global-set-key (kbd "C-c u") 'clang-format-buffer)
(global-set-key (kbd "M-<left>") 'switch-to-prev-buffer)
(global-set-key (kbd "M-<right>") 'switch-to-next-buffer)
;; ==== CUSTOM BINDS ====
