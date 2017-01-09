;; Check Emacs version
(when (version< emacs-version "25")
  (warn "Emacs version 25 or newer is strongly suggested. %s is found."
	emacs-version))

;; Disable the site default settings
(setq inhibit-default-init t)

;; Always load .el instead of .elc if it is newer
(setq load-prefer-newer t)

;; Package archives.
(setq package-archives
      '(("GNU ELPA"     . "http://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/")))

;; Package archives priorities.
;; Prefer MELPA Stable over GNU over MELPA.
(setq package-archive-priorities
      '(("MELPA Stable" . 10)
	("GNU ELPA"     . 5)
	("MELPA"        . 0)))

;; Now we initialize packages
(setq package-enable-at-startup nil)
(package-initialize)

;; Bootstrap "use-package"
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; use-package always downloads packages
(setq use-package-always-ensure t)

;; Configure backups and autosaves
(setq auto-save-dir "~/.autosave/")
(unless (file-exists-p auto-save-dir)
  (make-directory auto-save-dir))
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.backup"))
      auto-save-file-name-transforms `((".*" ,auto-save-dir t)))

;; Tabs instead of spaces
(setq-default indent-tabs-mode nil)

;; Open Racket files in Scheme mode
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . scheme-mode))

;; Show line numbers
(global-linum-mode 1)

;; Standard Emacs customizations
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Evil mode
(use-package evil
  :demand t
  :config (evil-mode t))

;; Emacs server
(use-package server
  :if (not noninteractive)
  :defer t
  :init (server-mode))
