;;; init-go.el --- Support for Go
;;; Commentary:
;;; Code:

(maybe-require-package 'go-mode)
(maybe-require-package 'go-projectile)
(maybe-require-package 'gotest)
(maybe-require-package 'flycheck-golangci-lint)

(add-hook 'go-mode-hook 'lsp)
(add-hook 'go-mode-hook #'lsp-deferred)

(defun go-setup-hook ()
  "Personal go-mode setup tasks."

  ;; Code layout.
  (setq tab-width 2 indent-tabs-mode 1) ; std go whitespace configuration
  (add-hook 'before-save-hook 'gofmt-before-save) ; run gofmt on each save

  (setq go-test-args "-race -failfast -timeout 10m -v")

  ;; Shortcuts for common go-test invocations.
  (let ((map go-mode-map))
    (define-key map (kbd "C-c a") 'go-test-current-project)
    (define-key map (kbd "C-c m") 'go-test-current-file)
    (define-key map (kbd "C-c .") 'go-test-current-test)))

(add-hook 'go-mode-hook 'go-setup-hook)
(add-hook 'go-mode-hook #'yas-minor-mode)

;; Add golangci-lint setup for flycheck
(with-eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))

(provide 'init-go)
;;; init-go.el ends here
