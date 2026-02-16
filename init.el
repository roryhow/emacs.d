;;; init.el --- Main configuration entry point -*- lexical-binding: t -*-
;;; Commentary:
;; Bootstrap use-package, set core defaults, and load modules.
;;; Code:

;;; --- Package bootstrap ---

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")))

;; Per-version elpa directory to avoid bytecode mismatch
(setq package-user-dir
      (expand-file-name (format "elpa-%s" emacs-version) user-emacs-directory))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)


;;; --- Core settings ---

;; UTF-8 everywhere
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; Custom file
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; No backups, lockfiles, or autosave
(setq make-backup-files nil
      create-lockfiles nil
      auto-save-default nil)

;; Indentation defaults
(setq-default tab-width 2
              standard-indent 2
              indent-tabs-mode nil)

;; Process performance tuning
(setq read-process-output-max (* 4 1024 1024)
      process-adaptive-read-buffering nil)

;; Misc
(setq inhibit-startup-screen t
      use-file-dialog nil
      use-dialog-box nil
      custom-safe-themes t
      frame-title-format "Emacs")


;;; --- macOS keys ---

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta
        mac-right-command-modifier 'super
        mac-option-modifier 'none)
  (menu-bar-mode t) ; needed for Cmd+Tab on macOS
  (global-set-key (kbd "M-`") 'ns-next-frame)
  (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
  (global-set-key (kbd "M-˙") 'ns-do-hide-others)
  (global-set-key (kbd "M-ˍ") 'ns-do-hide-others))


;;; --- Shell PATH ---

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :config (exec-path-from-shell-initialize))


;;; --- GC management ---

(use-package gcmh
  :diminish
  :config
  (setq gcmh-high-cons-threshold (* 128 1024 1024))
  (gcmh-mode 1))


;;; --- GCC JIT library paths (native-comp on macOS) ---

(defun my-append-env-var (var-name value)
  "Prepend VALUE to the environment variable VAR-NAME."
  (setenv var-name (if (getenv var-name)
                       (format "%s:%s" value (getenv var-name))
                     value)))

(let ((gccjitpath "/opt/homebrew/lib/gcc/14:/opt/homebrew/lib"))
  (mapc (lambda (var-name) (my-append-env-var var-name gccjitpath))
        '("LIBRARY_PATH" "LD_LIBRARY_PATH" "PATH")))


;;; --- Window management ---

(add-hook 'after-init-hook 'winner-mode)

(setq split-height-threshold 120
      split-width-threshold 160)

(defun my-split-window-sensibly (&optional window)
  "Replacement `split-window-sensibly' that prefers vertical splits."
  (interactive)
  (let ((window (or window (selected-window))))
    (or (and (window-splittable-p window t)
             (with-selected-window window
               (split-window-right)))
        (and (window-splittable-p window)
             (with-selected-window window
               (split-window-below))))))

(setq split-window-preferred-function #'my-split-window-sensibly)


;;; --- Font & theme ---

(set-face-attribute 'default nil :height 140)


;;; --- Frame settings ---

(add-to-list 'default-frame-alist '(undecorated-round . t))
(setq-default window-resize-pixelwise t
              frame-resize-pixelwise t)
(when (fboundp 'pixel-scroll-precision-mode)
  (pixel-scroll-precision-mode))


;;; --- Load modules ---

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-ui)
(require 'init-completion)
(require 'init-dev)
(require 'init-javascript)
(require 'init-typescript)
(require 'init-kotlin)
(require 'init-python)
(require 'init-scala)
(require 'init-go)
(require 'init-yaml)
(require 'init-docker)
(require 'init-terraform)


;;; --- Emacs server ---

(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))

(provide 'init)
;;; init.el ends here
