;;; init-scala.el --- Scala support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(maybe-require-package 'scala-mode)
(maybe-require-package 'sbt-mode)
(maybe-require-package 'lsp-mode)
(maybe-require-package 'lsp-ui)
(maybe-require-package 'company-lsp)

;; use scala-mode for scala files
;; double check if sbt-mode actually gets used here
(add-to-list 'auto-mode-alist '("\\.s\\(cala\\|bt\\)$" . scala-mode))

(after-load 'sbt-mode
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(after-load 'scala-mode
  (setq lsp-prefer-flymake nil)
  (add-hook 'scala-mode-hook 'lsp))

(provide 'init-scala)
;;; init-scala ends here
