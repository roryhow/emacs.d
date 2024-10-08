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
(require-package 'vterm)
(require-package 'cue-mode) ;; for cue files


(setq magit-refresh-status-buffer nil)

(defun projectile-file-copy-path ()
  "Gets the path for the current file relative to the project root."
  (interactive)
  (let ((path (file-relative-name buffer-file-name (projectile-project-root))))
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


(setq split-height-threshold 120
      split-width-threshold 160)

(defun my-split-window-sensibly (&optional window)
  "replacement `split-window-sensibly' function which prefers vertical splits"
  (interactive)
  (let ((window (or window (selected-window))))
    (or (and (window-splittable-p window t)
             (with-selected-window window
               (split-window-right)))
        (and (window-splittable-p window)
             (with-selected-window window
               (split-window-below))))))

(setq split-window-preferred-function #'my-split-window-sensibly)
(add-to-list 'default-frame-alist '(undecorated-round . t))

(defun my-append-env-var (var-name value)
  "Append VALUE to the beginning of current value of env variable VAR-NAME."
  (setenv var-name (if (getenv var-name)
                       (format "%s:%s" value (getenv var-name))
                     value)))

(let ((gccjitpath "/opt/homebrew/lib/gcc/14:/opt/homebrew/lib"))
  (mapc (lambda (var-name) (my-append-env-var var-name gccjitpath))
        '("LIBRARY_PATH" "LD_LIBRARY_PATH" "PATH")))

(provide 'init-local)
;;; init-local.el ends here
