;;; init-go.el --- Go support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package go-mode
  :hook ((go-mode . lsp-deferred)
         (go-mode . (lambda ()
                      (setq-local tab-width 2
                                  indent-tabs-mode t)
                      (add-hook 'before-save-hook #'gofmt-before-save nil t))))
  :bind (:map go-mode-map
         ("C-c a" . go-test-current-project)
         ("C-c m" . go-test-current-file)
         ("C-c ." . go-test-current-test)))

(use-package gotest
  :after go-mode
  :config
  (setq go-test-args "-race -failfast -timeout 10m -v"))

(provide 'init-go)
;;; init-go.el ends here
