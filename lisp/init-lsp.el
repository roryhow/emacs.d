;;; init-lsp.el --- Support for LSP mode
;;; Commentary:
;;; Code:

(maybe-require-package 'lsp-mode)
(maybe-require-package 'lsp-ui)
(maybe-require-package 'company-lsp)
(maybe-require-package 'yasnippet)

(after-load 'company-mode (push 'company-lsp company-backends))
(after-load 'lsp-mode
  (yas-minor-mode-on))

(setq lsp-file-watch-threshold 5000)

(provide 'init-lsp)
;;; init-lsp ends here
