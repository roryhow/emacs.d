;;; init-go.el --- Support for Go
;;; Commentary:
;;; Code:

(maybe-require-package 'go-mode)
(add-hook 'go-mode-hook 'lsp)
(add-hook 'go-mode-hook #'lsp-deferred)

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks))

(add-hook 'go-mode-hook #'yas-minor-mode)

(provide 'init-go)
;;; init-go.el ends here
