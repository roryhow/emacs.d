;;; init-go.el --- Support for Go
;;; Commentary:
;;; Code:

(maybe-require-package 'go-mode)
(maybe-require-package 'go-guru)
(maybe-require-package 'company-go)
(maybe-require-package 'flymake-go)
(maybe-require-package 'go-playground)
(maybe-require-package 'flycheck-golangci-lint)

;; Define function to call when go-mode loads
(defun my-go-mode-hook ()
  "Set up go-mode with some personal preferences."
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq gofmt-command "goimports")
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

  ;; guru settings
  (go-guru-hl-identifier-mode)

  ;; linting
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))


  ;; Key bindings specific to go-mode
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  (local-set-key (kbd "M-p") 'compile)
  (local-set-key (kbd "M-P") 'recompile)
  (local-set-key (kbd "M-]") 'next-error)
  (local-set-key (kbd "M-[") 'previous-error)

  (local-set-key (kbd "C-c C-t f") 'go-test-current-file)
  (local-set-key (kbd "C-c C-t t") 'go-test-current-test)
  (local-set-key (kbd "C-c C-t p") 'go-test-current-project)
  (local-set-key (kbd "C-c C-t b") 'go-test-current-benchmark)
  (local-set-key (kbd "C-c C-t x") 'go-run)

  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode))

;; Connect go-mode-hook with the function we just defined
(add-hook 'go-mode-hook 'my-go-mode-hook)
(add-hook 'go-mode-hook 'lsp)

(provide 'init-go)
;;; init-go.el ends here
