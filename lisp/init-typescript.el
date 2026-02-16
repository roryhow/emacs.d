;;; init-typescript.el --- TypeScript support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package web-mode
  :mode "\\.tsx\\'"
  :hook (web-mode . (lambda ()
                      (when (string-equal "tsx" (file-name-extension buffer-file-name))
                        (lsp-deferred))))
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-auto-indentation nil
        web-mode-enable-auto-quoting nil))

(provide 'init-typescript)
;;; init-typescript.el ends here
