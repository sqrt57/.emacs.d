;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
