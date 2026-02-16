;;; init-scala.el --- Scala support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$"
  :hook (scala-mode . lsp-deferred))

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package lsp-metals
  :after (scala-mode lsp-mode))

(provide 'init-scala)
;;; init-scala.el ends here
