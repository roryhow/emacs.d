;;; init-docker.el --- Docker support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package dockerfile-mode)

(use-package docker-compose-mode)

(use-package docker
  :commands docker)

(provide 'init-docker)
;;; init-docker.el ends here
