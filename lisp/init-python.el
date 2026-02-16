;;; init-python.el --- Python support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'python-base-mode-hook #'lsp-deferred)

(use-package ruff-format)

(use-package pip-requirements)

;; Recognise pyproject.toml as a project root
(with-eval-after-load 'project
  (add-to-list 'project-vc-extra-root-markers "pyproject.toml"))
(with-eval-after-load 'projectile
  (add-to-list 'projectile-project-root-files "pyproject.toml"))

(provide 'init-python)
;;; init-python.el ends here
