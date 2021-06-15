(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Snag the user's PATH and GOPATH
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(mapc 'load (directory-files "~/.emacs.d/keimoon" t ".*\.el"))
(mapc 'load (directory-files "~/.emacs.d/libs" t ".*\.el"))

(require 'setup-apps)
(require 'setup-editing)
(require 'setup-miscs)
(require 'setup-helm)
(require 'setup-files)
(require 'setup-dev)
(require 'setup-c)
(require 'setup-scala)
(require 'setup-go)
(require 'setup-dev-miscs)
(require 'setup-theme)
(require 'setup-ts)

(diredp-toggle-find-file-reuse-dir 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yaml-mode dap-mode lsp-metals posframe company-lsp fireplace go-rename tide groovy-mode toml-mode company-go exec-path-from-shell ranger docker company-rtags kubernetes sbt-mode company company-irony company-irony-c-headers helm-company ztree zenburn-theme yasnippet workgroups2 web-mode volatile-highlights undo-tree terraform-mode smartparens scala-mode recentf-ext pos-tip markdown-mode magit ibuffer-vc highlight-numbers helm-rtags helm-projectile go-mode function-args flycheck-popup-tip expand-region duplicate-thing dockerfile-mode docker-compose-mode diff-hl cmake-mode cmake-ide clean-aindent-mode auto-complete ample-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
