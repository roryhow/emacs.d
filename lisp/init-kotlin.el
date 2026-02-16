;;; init-kotlin.el --- Kotlin support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package kotlin-mode
  :hook (kotlin-mode . lsp-deferred))

(provide 'init-kotlin)
;;; init-kotlin.el ends here
