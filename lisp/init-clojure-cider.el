;;; init-clojure-cider.el --- Cider support for clojure -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-clojure)

(when (maybe-require-package 'cider)
  (setq nrepl-popup-stacktraces nil)

  ;; (setq cider-cljs-lein-repl
  ;;       "(do (require 'figwheel-sidecar.repl-api)
  ;;             (figwheel-sidecar.repl-api/start-figwheel!)
  ;;           (figwheel-sidecar.repl-api/cljs-repl))")

  (after-load 'cider
    (add-hook 'cider-repl-mode-hook 'subword-mode)
    (add-hook 'cider-repl-mode-hook 'paredit-mode))

  ;; Not working for me
  ;; (require-package 'flycheck-clojure)
  ;; (after-load 'clojure-mode
  ;;   (after-load 'cider
  ;;     (after-load 'flycheck
  ;;       (flycheck-clojure-setup))))
  )


(provide 'init-clojure-cider)
;;; init-clojure-cider.el ends here
