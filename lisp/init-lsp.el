;;; init-lsp.el --- Support for LSP mode
;;; Commentary:
;;; Code:

(maybe-require-package 'lsp-mode)
(maybe-require-package 'lsp-ui)
(maybe-require-package 'company-lsp)

(setq lsp-enable-snippet nil)

(push 'company-lsp company-backends)

;;; init-lsp ends here
