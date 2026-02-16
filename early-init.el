;;; early-init.el --- Pre-initialisation config -*- lexical-binding: t -*-
;;; Commentary:
;; Emacs 27+ loads this file before package-initialize and init.el.
;;; Code:

;; Suppress automatic package loading; we handle it in init.el
(setq package-enable-at-startup nil)

;; High GC threshold during startup (restored later by gcmh)
(setq gc-cons-threshold (* 128 1024 1024))

;; Suppress GUI chrome early for faster startup
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode) (set-scroll-bar-mode nil))
(menu-bar-mode -1)

(provide 'early-init)
;;; early-init.el ends here
