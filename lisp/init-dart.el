(require-package 'dart-mode)

(defun my-dart-goto ()
  (interactive)
  (xref-push-marker-stack)
  (dart-goto))

(with-eval-after-load 'dart-mode
  (setq dart-sdk-path "/usr/local/bin/dart")
  (setq dart-enable-analysis-server t)
  (add-hook 'dart-mode-hook 'flycheck-mode)
  (define-key dart-mode-map (kbd "M-.") 'my-dart-goto)
  (define-key dart-mode-map (kbd "C-i") 'company-indent-or-complete-common))

(provide 'init-dart)
