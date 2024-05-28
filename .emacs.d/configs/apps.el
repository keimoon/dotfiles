;; Workgroup
(use-package workgroups2
  :ensure t
  :config (require 'workgroups2))

;; Duplicate thing
(use-package duplicate-thing
  :ensure t
  :config
  (require 'duplicate-thing)
  (global-set-key (kbd "M-c") 'duplicate-thing)
  )

;; Volatile highlight
(use-package volatile-highlights
  :ensure t
  :config
  (require 'duplicate-thing)
  (global-set-key (kbd "M-c") 'duplicate-thing)(require 'volatile-highlights)
  (volatile-highlights-mode t)
  )

;; Smartparen
(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t)
  (setq blink-matching-paren nil)
  (setq sp-highlight-pair-overlay nil)
  (defun graphene--sp-pair-on-newline (id action context)
    "Put trailing pair on newline and return to point."
    (save-excursion
      (newline)
      (indent-according-to-mode)))

  (defun graphene--sp-pair-on-newline-and-indent (id action context)
    "Open a new brace or bracket expression, with relevant newlines and indent. "
    (graphene--sp-pair-on-newline id action context)
    (indent-according-to-mode))

  (sp-pair "{" nil :post-handlers
	   '(:add ((lambda (id action context)
		     (graphene--sp-pair-on-newline-and-indent id action context)) "RET")))
  (sp-pair "[" nil :post-handlers
	   '(:add ((lambda (id action context)
		     (graphene--sp-pair-on-newline-and-indent id action context)) "RET")))

  (sp-local-pair '(markdown-mode gfm-mode) "*" "*"
		 :unless '(sp-in-string-p)
		 :actions '(insert wrap))
  )


;; Clean aident mode
(use-package clean-aindent-mode
  :ensure t
  :config
  (require 'clean-aindent-mode)
  (add-hook 'prog-mode-hook 'clean-aindent-mode)
  )


;; Undo tree
;; (use-package undo-tree
;;   :ensure t
;;   :config
;;   (require 'undo-tree)
;;   (global-undo-tree-mode)
;;   )

;; Yasnippet
(use-package yasnippet
  :ensure t
  :config
  (require 'yasnippet)
  (yas-global-mode 1)
  )

;; Expand Region
(use-package expand-region
  :ensure t
  :config
  (require 'expand-region)
  (global-set-key (kbd "M-m") 'er/expand-region)
  )


;; Projectile
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  ;; Projectile keybindings
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )

;; Recentf-ext
(use-package recentf-ext
  :ensure t
  :config
  (require 'recentf-ext)
  )

;; Ztree
(use-package ztree
  :ensure t
  :config
  (require 'ztree-diff)
  (require 'ztree-dir)
  )
