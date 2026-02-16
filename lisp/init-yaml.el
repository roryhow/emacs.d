;;; init-yaml.el --- YAML support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package yaml-mode
  :hook (yaml-mode . display-line-numbers-mode))

(provide 'init-yaml)
;;; init-yaml.el ends here
