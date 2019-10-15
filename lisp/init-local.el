;;; init-local.el --- Local tweaks to config -*- lexical-binding: t -*-
;;; Commentary:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:

(setq
 tab-width 2
 standard-indent 2
 indent-tabs-mode nil
 frame-title-format "Emacs"
 vc-handled-backends nil
 custom-safe-themes t)
(require-package 'monokai-theme)
(load-theme 'monokai t)
(set-face-attribute 'default nil :height 130)

(maybe-require-package 'direnv)

(provide 'init-local)
;;; init-local.el ends here
