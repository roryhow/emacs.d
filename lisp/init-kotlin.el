;;; init-kotlin.el --- Kotlin support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package kotlin-mode
  :hook (kotlin-mode . lsp-deferred)
  :config
  (setenv "KOTLIN_LANGUAGE_SERVER_OPTS" "-Xmx4G")
  (with-eval-after-load 'lsp-mode
    (setq lsp-kotlin-ondisk-cache-enabled t)
    (setq lsp-auto-guess-root t)

    (defvar my-kotlin-monorepo-root "~/Documents/auxia-inc/source"
      "Root of the Auxia monorepo.")

    (defvar my-kotlin-workspace-dirs '("common" "delivery")
      "Subdirectories of the monorepo to use as LSP workspace roots.
Only these will be indexed by the Kotlin language server.
Add more directories here as you start working on them.")

    (defun my-kotlin-lsp-root ()
      "Return the nearest watched subdirectory as the LSP project root.
If the current file lives under one of `my-kotlin-workspace-dirs',
return that subdirectory instead of the monorepo root. This limits
what the Kotlin language server indexes at startup."
      (when-let* ((file (buffer-file-name))
                  (root (file-name-as-directory
                         (expand-file-name my-kotlin-monorepo-root))))
        (cl-loop for dir in my-kotlin-workspace-dirs
                 for full = (file-name-as-directory
                             (expand-file-name dir root))
                 when (string-prefix-p full (expand-file-name file))
                 return (directory-file-name full))))

    (advice-add 'lsp--suggest-project-root :before-until
                (lambda ()
                  (when (derived-mode-p 'kotlin-mode)
                    (my-kotlin-lsp-root))))))

(provide 'init-kotlin)
;;; init-kotlin.el ends here
