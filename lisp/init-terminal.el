;;; init-terminal.el --- Terminal emulation -*- lexical-binding: t -*-
;;; Commentary:
;; vterm configuration.
;;; Code:

(use-package vterm
  :bind ("C-c t" . vterm)
  :config
  (setq vterm-max-scrollback 10000))

(provide 'init-terminal)
;;; init-terminal.el ends here
