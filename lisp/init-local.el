;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:

;; Set custom tab width, standard indent and use spaces rather than tabs
(setq
 tab-width 2
 standard-indent 2
 indent-tabs-mode nil)
(set-face-attribute 'default nil :height 130)

(setq frame-title-format "Emacs")
(setq vc-handled-backends nil)

(after-load 'eldoc
  (when (maybe-require-package 'diminish)
    (diminish 'eldoc-mode)))

(provide 'init-local)
;;; init-local.el ends here
