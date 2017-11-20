(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(mapc 'load (directory-files "~/.emacs.d/keimoon" t ".*\.el"))

(require 'setup-apps)
(require 'setup-editing)
(require 'setup-miscs)
(require 'setup-helm)
(require 'setup-dev)
(require 'setup-c)
(require 'setup-scala)
(require 'setup-dev-miscs)
(require 'setup-theme)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-rtags kubernetes sbt-mode company company-irony company-irony-c-headers helm-company ztree zenburn-theme yasnippet workgroups2 web-mode volatile-highlights undo-tree terraform-mode smartparens scala-mode recentf-ext pos-tip markdown-mode magit ibuffer-vc highlight-numbers helm-rtags helm-projectile go-mode function-args flycheck-popup-tip expand-region duplicate-thing dockerfile-mode docker-compose-mode dired+ diff-hl cmake-mode cmake-ide clean-aindent-mode auto-complete ample-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
