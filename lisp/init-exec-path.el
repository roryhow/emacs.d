;;; init-exec-path.el --- Set up exec-path to help Emacs find programs  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'exec-path-from-shell)

(after-load 'exec-path-from-shell
  (dolist (var '("SSH_AUTH_SOCK" "GOPATH" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
    (add-to-list 'exec-path-from-shell-variables var)))


(when (or (memq window-system '(mac ns x))
          (unless (memq system-type '(ms-dos windows-nt))
            (daemonp)))
  (exec-path-from-shell-initialize))


;; this fixes things but it's a bit awkward
;; (setenv "PATH" (concat (getenv "PATH") ":~/.nvm/versions/node/v10.8.0/bin"))
;; (setq exec-path (append exec-path '("~/.nvm/versions/node/v10.8.0/bin")))

;; fixing lein problems
;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
;; (setq exec-path (append exec-path '("/usr/local/bin")))

(provide 'init-exec-path)
;;; init-exec-path.el ends here
