;;; init-terraform.el --- Terraform support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package terraform-mode)

(use-package reformatter
  :config
  (reformatter-define terraform-format
    :program "terraform" :args '("fmt" "-")))

(provide 'init-terraform)
;;; init-terraform.el ends here
