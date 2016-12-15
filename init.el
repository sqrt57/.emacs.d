;; Customizations
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
