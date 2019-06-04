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
  (add-hook 'before-save-hook 'gofmt-before-save)    ; gofmt before every save
  (setq gofmt-command "goimports")                   ; gofmt uses invokes goimports
  (if (not (string-match "go" compile-command))      ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

  ;; guru settings
  (go-guru-hl-identifier-mode)                       ; highlight identifiers

  ;; linting
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))

  ;; Key bindings specific to go-mode
  (local-set-key (kbd "M-.") 'godef-jump) ; Go to definition
  (local-set-key (kbd "M-*") 'pop-tag-mark) ; Return from whence you came
  (local-set-key (kbd "M-p") 'compile)      ; Invoke compiler
  (local-set-key (kbd "M-P") 'recompile) ; Redo most recent compile cmd
  (local-set-key (kbd "M-]") 'next-error) ; Go to next error (or msg)
  (local-set-key (kbd "M-[") 'previous-error) ; Go to previous error or msg

  (local-set-key (kbd "C-c C-t f") 'go-test-current-file)
  (local-set-key (kbd "C-c C-t t") 'go-test-current-test)
  (local-set-key (kbd "C-c C-t p") 'go-test-current-project)
  (local-set-key (kbd "C-c C-t b") 'go-test-current-benchmark)
  (local-set-key (kbd "C-c C-t x") 'go-run)

  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode))

;; Connect go-mode-hook with the function we just defined
(add-hook 'go-mode-hook 'my-go-mode-hook)

(provide 'init-go)
;;; init-go.el ends here
