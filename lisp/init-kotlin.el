;;; init-kotlin.el --- Kotlin support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package kotlin-mode
  :hook (kotlin-mode . lsp-deferred)
  :config
  (setenv "KOTLIN_LANGUAGE_SERVER_OPTS" "-Xmx4G")
  (with-eval-after-load 'lsp-mode
    ;; Cache the index to disk so restarts are faster.
    (setq lsp-kotlin-ondisk-cache-enabled t)
    ;; Allowlist: only watch these directories for file changes.
    ;; Add services here as you start working on them.
    (defvar my-lsp-watched-dirs '("common" "delivery"
                                  "gradle" "buildSrc" "build")
      "Directories to watch in the Auxia monorepo. Everything else is ignored.")

    (let ((source-dir "~/Documents/auxia-inc/source"))
      (when (file-directory-p source-dir)
        (dolist (dir (directory-files source-dir nil "^[^.]"))
          (when (and (file-directory-p (expand-file-name dir source-dir))
                     (not (member dir my-lsp-watched-dirs)))
            (add-to-list 'lsp-file-watch-ignored-directories
                         (concat "[/\\\\]" (regexp-quote dir) "\\'"))))))))

(provide 'init-kotlin)
;;; init-kotlin.el ends here
