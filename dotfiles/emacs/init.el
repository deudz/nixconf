(use-package use-package
  :ensure nil
  :init (setopt use-package-always-ensure t))

(use-package emacs
  :config
  (setopt make-backup-files nil)

  (require 'package)

  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)

  (setopt inhibit-startup-screen t
	  initial-major-mode #'fundamental-mode)
  (setopt use-short-answers t)

  (setopt visible-bell t)

  (column-number-mode 1)

  (setopt native-comp-async-report-warnings-errors 'silent)

  (setopt completion-ignore-case t
	  read-buffer-completion-ignore-case t
	  read-file-name-completion-ignore-case t))

(use-package no-littering)
(if (package-installed-p 'no-littering)
    (setopt custom-file (no-littering-expand-etc-file-name "custom.el"))
  (setopt custom-file (expand-file-name "custom.el" user-emacs-directory)))
(load-file custom-file)

(use-package god-mode
  :init (god-mode-all 1)
  :bind
  ("<escape>" . god-mode-all)

  ("C-x C-1" . delete-other-windows)
  ("C-x C-2" . split-window-below)
  ("C-x C-3" . split-window-right)
  ("C-x C-0" . delete-window)

  ("C-x C-#" . server-edit)
  
  ("C-z" . repeat))

(use-package which-key
  :config
  (which-key-mode 1)
  (if (package-installed-p 'god-mode)
      (which-key-enable-god-mode-support)))
   
(use-package helpful
  :config
  (defalias 'describe-function #'helpful-callable)
  (defalias 'describe-variable #'helpful-variable)
  (defalias 'describe-key #'helpful-key))

(use-package switch-window
  :bind ("C-x o" . switch-window))

(use-package anzu
  :config (global-anzu-mode 1))

(use-package vertico
  :config (vertico-mode 1))
(use-package marginalia
  :after vertico
  :config (marginalia-mode 1))
(use-package consult)

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package doom-modeline
  :config
  (doom-modeline-mode 1)
  (setopt doom-modeline-height 28))

(use-package indent-bars
  :custom (indent-bars-starting-column 0)
  :hook (prog-mode . indent-bars-mode))
 
(use-package rainbow-mode
  :hook (prog-mode . rainbow-mode))

(use-package display-line-numbers
  :ensure nil
  :custom (display-line-numbers-type 'relative)
  :hook (prog-mode . display-line-numbers-mode))

(use-package nerd-icons)
(use-package prog-mode
  :ensure nil
  :config (global-prettify-symbols-mode 1))

(use-package multiple-cursors)
(use-package visual-regexp)

(use-package smartparens
  :hook (prog-mode . smartparens-mode))

(use-package prism
  :hook (prog-mode . prism-mode))
(use-package paren
  :ensure nil
  :config
  (show-paren-mode 1)
  :custom
  (show-paren-delay 0)
  (show-paren-context-when-offscreen #'child-frame))

(use-package doom-themes
  :config (load-theme 'doom-city-lights t))
(use-package solaire-mode
  :after doom-themes
  :config (solaire-global-mode t))

(use-package vundo)

(use-package lsp-mode)
(use-package lsp-ui
  :if (package-installed-p 'lsp-mode)
  :after lsp-mode
  :config (lsp-ui-mode 1))
(use-package corfu
  :config (global-corfu-mode 1)
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.0)
  :bind (:map corfu-map
	      ("RET" . corfu-insert)
	      ("TAB" . corfu-next)
	      ("S-TAB" . corfu-previous)))
(use-package cape
  :config
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-history))

(use-package nix-mode)
(use-package d-mode)
(use-package odin-mode
  :vc (:url "https://github.com/mattt-b/odin-mode")
  :mode "\\.odin\\'")

(use-package flymake)

(use-package eldoc)
(use-package eldoc-box)

(use-package projectile)

(use-package treemacs
  :custom (treemacs-position 'right))
(use-package treemacs-nerd-icons
  :if (package-installed-p 'treemacs)
  :after treemacs
  :custom
  (treemacs-load-theme "nerd-icons"))

(use-package magit)
(use-package magit-todos)
(use-package forge)

;; TODO: the key bind needs to be a hook
(use-package eshell
  :ensure nil
  :config
;;  (bind-key "C-p" #'eshell-previous-matching-input-from-input 'eshell-hist-mode-map)
;;  (bind-key "C-n" #'eshell-next-matching-input-from-input 'eshell-hist-mode-map))

(use-package org
  :ensure nil)
(use-package org-bullets
  :if (package-installed-p 'org)
  :hook (org-mode . org-bullets-mode))
