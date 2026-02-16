;;; init-ui.el --- UI, theme, and editing helpers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package monokai-theme
  :config (load-theme 'monokai t))

(use-package dimmer
  :config
  (setq dimmer-fraction 0.15)
  (dimmer-mode t))

(use-package default-text-scale
  :config (default-text-scale-mode))

(use-package which-key
  :diminish
  :config
  (setq which-key-idle-delay 1.5)
  (which-key-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package mode-line-bell
  :config (mode-line-bell-mode))

;; Line numbers in prog-mode
(setq-default display-line-numbers-width 3)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Built-in editing helpers
(add-hook 'after-init-hook 'electric-pair-mode)
(add-hook 'after-init-hook 'electric-indent-mode)
(add-hook 'after-init-hook 'show-paren-mode)
(add-hook 'after-init-hook 'delete-selection-mode)
(add-hook 'after-init-hook 'global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(provide 'init-ui)
;;; init-ui.el ends here
