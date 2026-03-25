;;; init-protobuf.el --- Protobuf support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package protobuf-mode
  :hook (protobuf-mode . lsp-deferred)
  :config
  (require 'lsp-bufls))

(provide 'init-protobuf)
;;; init-protobuf.el ends here
