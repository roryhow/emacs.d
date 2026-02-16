;;; init-javascript.el --- JavaScript support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package js2-mode)

(use-package json-mode)

(setq-default js-indent-level 2)

(add-hook 'js-mode-hook #'lsp-deferred)

(provide 'init-javascript)
;;; init-javascript.el ends here
