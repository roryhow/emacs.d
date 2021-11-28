;;; init-php.el --- Support for working with PHP -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; Add some config for 

(add-to-list 'auto-mode-alist '("\\.\\(inc\\|module\\)?\\'" . php-mode))

(add-hook 'php-mode-hook 'lsp)
(add-hook 'php-mode-hook #'lsp-deferred)

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


(setq lsp-intelephense-stubs
      ["bcmath" "bz2" "calendar" "Core" "curl" "date" "dba" "dom" "enchant" "fileinfo" "filter" "ftp" "gd" "gettext" "hash" "iconv" "imap" "intl" "json" "ldap" "libxml" "mbstring" "mcrypt" "mysql" "mysqli" "password" "pcntl" "pcre" "PDO" "pdo_mysql" "Phar" "readline" "recode" "Reflection" "regex" "session" "SimpleXML" "soap" "sockets" "sodium" "SPL" "standard" "superglobals" "sysvsem" "sysvshm" "tokenizer" "xml" "xdebug" "xmlreader" "xmlwriter" "yaml" "zip" "zlib" "wordpress" "woocommerce" "acf-pro" "wordpress-globals" "wp-cli" "genesis" "polylang"])


(provide 'init-php)
;;; init-php.el ends here
