;;; init-scala.el --- Scala support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(maybe-require-package 'scala-mode)
(maybe-require-package 'sbt-mode)

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
  ;; hook lsp into scala (requires metals)
  (when (maybe-require-package 'lsp-mode)
    (add-hook 'scala-mode-hook 'lsp))
  (add-hook 'before-save-hook #'lsp-format-buffer nil t))

(provide 'init-scala)
;;; init-scala ends here
