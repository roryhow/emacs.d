;;; init-plantuml.el --- Support for PlantUML
;;; Commentary:
;;; Code:

(maybe-require-package 'plantuml-mode)

(setq  plantuml-jar-path "/usr/local/bin/plantuml"
       plantuml-exec-mode 'executable
       plantuml-output-type "png")

;; Enable plantuml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))

(provide 'init-plantuml)
;;; init-plantuml.el ends here
