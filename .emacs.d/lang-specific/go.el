(provide 'setup-go)

;; The following package must be installed
;; go get -u golang.org/x/tools/cmd/...
;; go get -u github.com/rogpeppe/godef/...
;; go get -u github.com/nsf/gocode
;; go get -u golang.org/x/tools/cmd/goimports
;; go get -u github.com/dougm/goflymake
;; go get -u golang.org/x/tools/gopls@latest

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook 'lsp-format-buffer t t)
  (add-hook 'before-save-hook 'lsp-organize-imports t t))
(add-hook 'go-mode-hook 'lsp-go-install-save-hooks)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

(setq lsp-gopls-staticcheck t)
(setq lsp-eldoc-render-all t)
(setq lsp-gopls-complete-unimported t)

(setq lsp-ui-doc-enable nil
      lsp-ui-peek-enable t
      lsp-ui-sideline-enable t
      lsp-ui-imenu-enable t
      lsp-ui-flycheck-enable t)

(defun my-go-mode-hook()
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v"))

  (local-set-key (kbd "M-,") 'pop-tag-mark)
  (local-set-key (kbd "M-p") 'compile)
  (local-set-key (kbd "M-P") 'recompile)
  (local-set-key (kbd "C-c C-c") 'helm-company)
  )

(add-hook 'go-mode-hook 'my-go-mode-hook)
