;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(maybe-require-package 'elpy)
(after-load 'python
  (setq elpy-rpc-python-command "python3")
  (elpy-enable))

(provide 'init-python)
;;; init-python.el ends here
