;;; init-lsp.el --- Support for LSP mode
;;; Commentary:
;;; Code:

(maybe-require-package 'lsp-mode)
(maybe-require-package 'lsp-ui)
(maybe-require-package 'yasnippet)

(with-eval-after-load 'lsp-mode
  (yas-minor-mode-on))

(setq
 lsp-file-watch-threshold 5000
 lsp-prefer-capf t
 lsp-headerline-breadcrumb-mode nil)

(provide 'init-lsp)
;;; init-lsp ends here
