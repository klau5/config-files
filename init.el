(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq inhibit-startup-screen t)
(setq make-backup-files nil)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(line-number-mode +1)
(global-display-line-numbers-mode 1)
;; change font
(set-frame-font "Ubuntu Mono 11" nil t)
;; remove whitespace on filesave
(add-hook 'before-save-hook 'whitespace-cleanup)

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; smart parens
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode +1))

;; completion
(use-package company
  :ensure t
  :hook
  (prog-mode . company-mode)
  :init
  (eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))
  :config
  (setq company-idle-delay 0)
  (global-company-mode t))

;; company box
(use-package company-box
  :ensure t
  :hook
  (company-mode . company-box-mode))

;; syntax checking
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode t))

;; theme
(use-package darkokai-theme
  :ensure t
  :config
  (load-theme 'darkokai t))

;; ivy
(use-package ivy
  :ensure t
  :bind
  ("C-s" . swiper)
  :custom
  (ivy-count-format "%d/%d ")
  :config
  (ivy-mode 1))

;; rainbow delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Hello, klau5"
	dashboard-startup-banner 'logo
	dashboard-center-content t))

;; web mode
(use-package web-mode
  :ensure t
  :mode
  ("\\.html?\\'" . web-mode)
  ("\\.css?\\'" . web-mode)
  :config
  (setq web-mode-markup-indent-offset 2
	web-mode-code-indent-offset 2
	web-mode-css-indent-offset 2
	web-mode-enable-css-colorization t))

;; emmet mode
(use-package emmet-mode
  :ensure t
  :hook
  (sgml-mode . emmet-mode)
  (web-mode . emmet-mode)
  :config
  (emmet-mode t))

;; lsp mode
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((web-mode . lsp-deferred)
  (js-mode . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
;;  :config
;;  (setq lsp-diagnostics-provider :none))

;; prettier-js
(use-package prettier-js
  :ensure t
  :hook
  (web-mode . prettier-js-mode)
  (js-mode . prettier-js-mode)
  :config
  (setq prettier-js-args '(
	"--single-quote" "true")))

;; tree-sitter
(use-package tree-sitter
  :ensure t
  :hook
  (tree-sitter-after-on-hook . tree-sitter-hl-mode)
  (js-mode . tree-sitter-hl-mode)
  :config(global-tree-sitter-mode))

(use-package tree-sitter-langs
  :ensure t)

;; all-the-icons
(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))

;; evil mode
(use-package evil
  :ensure t
  :custom
  (evil-esc-delay 0.001 "avoid ESC/meta mixups")
  (evil-shift-width 4)
  :config
  (evil-mode 1))

;; mode line
(use-package mood-line
  :ensure t
  :config
  (mood-line-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(mood-line evil swiper all-the-icons-dired all-the-icons tree-sitter-langs tree-sitter prettier-js lsp-mode emmet-mode web-mode dashboard rainbow-delimiters ivy darkokai-theme flycheck company-box company which-key smartparens use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
