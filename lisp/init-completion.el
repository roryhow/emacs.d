;;; init-completion.el --- Minibuffer completion stack -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default history-length 1000)
(add-hook 'after-init-hook 'savehist-mode)

(add-hook 'after-init-hook 'recentf-mode)
(setq-default
 recentf-max-saved-items 1000
 recentf-exclude '("/tmp/" "/ssh:" "/sshx:"))

(use-package vertico
  :config (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(substring orderless)))

(use-package consult
  :bind (([remap switch-to-buffer] . consult-buffer)
         ([remap switch-to-buffer-other-window] . consult-buffer-other-window)
         ([remap switch-to-buffer-other-frame] . consult-buffer-other-frame)
         ([remap goto-line] . consult-goto-line)
         ("M-?" . consult-ripgrep))
  :config
  (consult-customize
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   :preview-key "M-P"))

(use-package marginalia
  :config (marginalia-mode))

(provide 'init-completion)
;;; init-completion.el ends here
