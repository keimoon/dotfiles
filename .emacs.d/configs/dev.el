;; Diff
(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode)
  (diff-hl-margin-mode)
  (setq diff-hl-margin-side 'right)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  )

;; Magit
(use-package magit
  :ensure t
  :config
  (require 'magit)
  (set-default 'magit-stage-all-confirm nil)
  (add-hook 'magit-mode-hook 'magit-load-config-extensions)

  ;; full screen magit-status
  (defadvice magit-status (around magit-fullscreen activate)
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))

  (global-unset-key (kbd "C-x g"))
  (global-set-key (kbd "C-x g h") 'magit-log)
  (global-set-key (kbd "C-x g f") 'magit-file-log)
  (global-set-key (kbd "C-x g b") 'magit-blame-mode)
  (global-set-key (kbd "C-x g m") 'magit-branch-manager)
  (global-set-key (kbd "C-x g c") 'magit-branch)
  (global-set-key (kbd "C-x g s") 'magit-status)
  (global-set-key (kbd "C-x g r") 'magit-reflog)
  (global-set-key (kbd "C-x g t") 'magit-tag)
  )

;; Flycheck
(use-package flycheck
  :ensure t
  :config
  (require 'flycheck)
  (add-hook 'after-init-hook #'global-flycheck-mode)

  (use-package flycheck-popup-tip
    :ensure t
    :config
    (with-eval-after-load 'flycheck
      (flycheck-popup-tip-mode))
    )
  )

;; Company
(use-package company
  :ensure t
  :config
  (require 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  ;; Delay when idle because I want to be able to think
  (setq company-idle-delay 0.2)

  (use-package helm-company
    :ensure t
    :config
    (eval-after-load 'company
      '(progn
	 (define-key company-mode-map (kbd "C-c C-c") 'helm-company)
	 (define-key company-active-map (kbd "C-c C-c") 'helm-company)))
    )
  )
