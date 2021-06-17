(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package))

(setq diredp-hide-details-initially-flag nil)

(mapc 'load (directory-files "~/.emacs.d/configs" t ".*\.el"))
(mapc 'load (directory-files "~/.emacs.d/libs" t ".*\.el"))

;; Dired+
(use-package dired+
  :config
  (diredp-toggle-find-file-reuse-dir 1)
  )

;; Load language specific files here
;; (load "~/.emacs.d/lang-specific/c.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(markdown-mode terraform-mode helm-projectile yaml-mode ample-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
