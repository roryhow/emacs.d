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
(when (maybe-require-package 'emojify)
  (add-hook 'after-init-hook #'global-emojify-mode)
  (setq emojify-emoji-styles '(github unicode)))

(when (file-directory-p "~/Documents/misc/telega.el")
  (add-to-list 'load-path "~/Documents/misc/telega.el/")
  (require-package 'visual-fill-column)
  (setq telega-use-notifications t)
  (add-hook 'telega-chat-mode-hook
            (lambda () (setq company-backends '(telega-company-emoji))))
  (require 'telega))

(provide 'init-local)
;;; init-local.el ends here
