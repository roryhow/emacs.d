;;; init-latex.el --- LaTeX support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(maybe-require-package 'auctex)
(maybe-require-package 'company-auctex)

(setq-default TeX-master nil)
(setq TeX-auto-save t
      TeX-parse-self t
      reftex-plug-into-AUCTeX t
      TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(provide 'init-latex)

;;; init-latex.el ends here
