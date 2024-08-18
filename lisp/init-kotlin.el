;;; init-kotlin.el --- Support for Kotlin
;;; Commentary:
;;; Code:

(maybe-require-package 'kotlin-mode)

(add-hook 'kotlin-mode-hook 'lsp)
(add-hook 'kotlin-mode-hook #'lsp-deferred)

(provide 'init-kotlin)
;;; init-kotlin.el ends here
