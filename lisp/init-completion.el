;;; init-completion.el --- Minibuffer completion stack -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

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
