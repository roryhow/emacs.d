;;; init-dev.el --- Development tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; --- Git ---

(use-package magit
  :bind (("C-x g" . magit-status)
         ("M-<f12>" . magit-status)
         ("C-x M-g" . magit-dispatch))
  :config
  (setq magit-diff-refine-hunk 'all
        magit-diff-visit-prefer-worktree t
        magit-refresh-status-buffer nil))

(use-package git-modes)

(use-package git-link)

(use-package git-timemachine
  :bind ("C-x v t" . git-timemachine-toggle))


;;; --- Project management ---

(use-package projectile
  :diminish
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (projectile-mode +1))

(use-package projectile-ripgrep
  :after projectile)


;;; --- Syntax checking ---

(use-package flycheck
  :config (global-flycheck-mode))


;;; --- LSP ---

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-file-watch-threshold 5000
        lsp-headerline-breadcrumb-enable nil))

(use-package lsp-ui
  :after lsp-mode)


;;; --- Direnv ---

(use-package envrc
  :bind (:map envrc-mode-map
         ("C-c e" . envrc-command-map))
  :config (envrc-global-mode))


;;; --- Tree-sitter ---

(when (and (require 'treesit nil t)
           (fboundp 'treesit-available-p)
           (treesit-available-p))

  (setq treesit-font-lock-level 4)

  (defun my-auto-configure-treesitter ()
    "Find installed grammars and remap to -ts-modes when available."
    (let ((grammar-name-to-emacs-lang '(("c-sharp" . "csharp")
                                         ("cpp" . "c++")
                                         ("gomod" . "go-mod")
                                         ("javascript" . "js")))
          seen-grammars)
      (dolist (dir (cons (expand-file-name "tree-sitter" user-emacs-directory)
                         treesit-extra-load-path))
        (when (file-directory-p dir)
          (dolist (file (directory-files dir))
            (let ((fname (file-name-sans-extension (file-name-nondirectory file))))
              (when (string-match "libtree-sitter-\\(.*\\)" fname)
                (let* ((file-lang (match-string 1 fname))
                       (emacs-lang (or (cdr (assoc-string file-lang grammar-name-to-emacs-lang)) file-lang)))
                  (unless (or (memq (intern emacs-lang) seen-grammars)
                              (string-equal file-lang emacs-lang))
                    (let ((libname (concat "tree_sitter_" (replace-regexp-in-string "-" "_" file-lang))))
                      (add-to-list 'treesit-load-name-override-list
                                   (list (intern emacs-lang) fname libname))))
                  (let ((ts-mode-name (intern (concat emacs-lang "-ts-mode")))
                        (regular-mode-name (intern (concat emacs-lang "-mode"))))
                    (when (fboundp ts-mode-name)
                      (add-to-list 'major-mode-remap-alist
                                   (cons regular-mode-name ts-mode-name))))
                  (push (intern emacs-lang) seen-grammars)))))))
      seen-grammars))

  (my-auto-configure-treesitter)

  ;; Also remap js2-mode to js-ts-mode when grammar is available
  (when (and (fboundp 'treesit-ready-p)
             (treesit-ready-p 'javascript t)
             (fboundp 'js-ts-mode))
    (add-to-list 'major-mode-remap-alist '(js2-mode . js-ts-mode))))


;;; --- Claude ---
(use-package claude-code-ide
  :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
  :bind ("C-c C-'" . claude-code-ide-menu) ; Set your favorite keybinding
  :config
  (claude-code-ide-emacs-tools-setup)) ; Optionally enable Emacs MCP tools

(provide 'init-dev)
;;; init-dev.el ends here
