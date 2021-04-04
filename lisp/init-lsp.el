;;; init-lsp.el --- Support for LSP mode
;;; Commentary:
;;; Code:

(maybe-require-package 'lsp-mode)
(maybe-require-package 'lsp-ui)
(maybe-require-package 'yasnippet)

(with-eval-after-load 'lsp-mode
  (yas-minor-mode-on))

(setq lsp-file-watch-threshold 5000)

(provide 'init-lsp)
;;; init-lsp ends here
