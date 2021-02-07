;;; init-php.el --- Support for working with PHP -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; Add some config for 
(add-to-list 'auto-mode-alist '("\\.\\(inc\\|module\\)?\\'" . php-mode))

(when (maybe-require-package 'php-mode)
  (setq-default
   c-basic-offset 2
   tab-width 2
   show-trailing-whitespace t
   php-mode-lineup-cascaded-calls nil
   php-style-delete-trailing-whitespace t)
  (maybe-require-package 'smarty-mode)

  (when (maybe-require-package 'company-php)
    (with-eval-after-load 'company
      (add-to-list 'company-backends 'company-ac-php-backend))))

(provide 'init-php)
;;; init-php.el ends here
