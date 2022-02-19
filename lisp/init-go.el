;;; init-go.el --- Support for Go
;;; Commentary:
;;; Code:

(maybe-require-package 'go-mode)
(maybe-require-package 'go-projectile)
(maybe-require-package 'gotest)

(add-hook 'go-mode-hook 'lsp)
(add-hook 'go-mode-hook #'lsp-deferred)

(defun go-setup-hook ()
  "Personal go-mode setup tasks."

  ;; Code layout.
  (setq tab-width 2 indent-tabs-mode 1) ; std go whitespace configuration
  (add-hook 'before-save-hook 'gofmt-before-save) ; run gofmt on each save

  ;; Shortcuts for common go-test invocations.
  (let ((map go-mode-map))
    (define-key map (kbd "C-c a") 'go-test-current-project)
    (define-key map (kbd "C-c m") 'go-test-current-file)
    (define-key map (kbd "C-c .") 'go-test-current-test)))

(add-hook 'go-mode-hook 'go-setup-hook)
(add-hook 'go-mode-hook #'yas-minor-mode)

(provide 'init-go)
;;; init-go.el ends here
