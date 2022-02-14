;;; init-lsp.el --- Support for LSP mode
;;; Commentary:
;;; Code:

(maybe-require-package 'lsp-mode)
(maybe-require-package 'lsp-ui)

(setq
 lsp-file-watch-threshold 5000
 lsp-prefer-capf t
 lsp-headerline-breadcrumb-enable nil)

(provide 'init-lsp)
;;; init-lsp ends here
