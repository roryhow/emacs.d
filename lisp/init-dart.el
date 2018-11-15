(require-package 'dart-mode)

(defun my-dart-goto ()
  (interactive)
  (xref-push-marker-stack)
  (dart-goto))

(after-load 'dart-mode
  (setq dart-sdk-path "/usr/local/bin/dart")
  (setq dart-enable-analysis server t)
  (add-hook 'dart-mode-hook 'flycheck-mode)
  :bind
  (:map dart-mode-map
        ("M-." . my-dart-goto)
        ("C-i" . company-indent-or-complete-common)
        ("C-M-i" . company-indent-or-complete-common))
  :config)

(provide 'init-dart)
