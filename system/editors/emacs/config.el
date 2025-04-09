(use-package emacs
  :init
  (setq make-backup-files nil)
  (setq standard-indent 2)

  (menu-bar-mode 0)
  (tool-bar-mode 0)
  (scroll-bar-mode 0)

  :hook (prog-mode . display-line-numbers-mode))

(use-package devil
  :ensure t
  :init (global-devil-mode 1))

(use-package nix-mode
  :ensure t)

(use-package vertico
  :ensure t
  :init (vertico-mode 1))
(use-package consult
  :ensure t)
(use-package embark
  :ensure t)
(use-package embark-consult
  :ensure t)
(use-package orderless
  :ensure t)
(use-package marginalia
  :ensure t
  :after vertico
  :config (marginalia-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-nord t))
(use-package diredfl
  :ensure t
  :hook (dired-mode . diredfl-mode))
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :ensure t
  :init (which-key-mode 1))
(use-package helpful
  :ensure t
  :bind (("C-h f" . helpful-callable)
	 ("C-h v" . helpful-variable)
	 ("C-h k" . helpful-key)))

(use-package magit
  :ensure t)
