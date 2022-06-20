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
(when *is-a-mac* (menu-bar-mode t)) ;; Required for correct CMD+tab functionality on Mac
(require-package 'monokai-theme)
(load-theme 'monokai t)
(set-face-attribute 'default nil :height 140)

(require-package 'direnv)
(require-package 'protobuf-mode)

(defun projectile-file-copy-path ()
  "Gets the path for the current file relative to the project root."
  (interactive)
  (let (path (file-relative-name buffer-file-name (projectile-project-root)))
    (kill-new path)
    (message "%s added to kill ring." path)))

;; Credit to https://github.com/magit/forge/issues/91#issuecomment-1003823864
(defun forge-browse-buffer-file ()
  "Browse the current file at REMOTE, highlighting region if selected."
  (interactive)
  (browse-url
   (let
       ((rev (magit-rev-abbrev "HEAD"))
        (repo (forge-get-repository 'stub))
        (file (magit-file-relative-name buffer-file-name))
        (highlight
         (if
             (use-region-p)
             (let ((l1 (line-number-at-pos (region-beginning)))
                   (l2 (line-number-at-pos (- (region-end) 1))))
               (format "#L%d-L%d" l1 l2))
           ""
           )))
     (forge--format repo "https://%h/%o/%n/blob/%r/%f%L"
                    `((?r . ,rev) (?f . ,file) (?L . ,highlight))))))

(provide 'init-local)
;;; init-local.el ends here
