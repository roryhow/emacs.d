;;; init-latex.el --- LaTeX support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(maybe-require-package 'auctex)
(maybe-require-package 'company-auctex)

(setq-default TeX-master nil)
(setq TeX-auto-save t
      TeX-parse-self t
      TeX-command-default "LaTeX"
      reftex-plug-into-AUCTeX t
      TeX-PDF-mode t
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

(when (maybe-require-package 'pdf-tools)
  (setenv "PKG_CONFIG_PATH" "/opt/local/lib/pkgconfig")
  (setq pdf-tools-handle-upgrades nil)
  (setq-default pdf-view-display-size 'fit-page)
  (pdf-tools-install))

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq company-idle-delay 0.1)
            (company-auctex-init)
            (flyspell-mode)
            (LaTeX-math-mode)))
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(provide 'init-latex)

;;; init-latex.el ends here
