;; Install gopls with GO111MODULE=on go get golang.org/x/tools/gopls@latest

(use-package go-mode
  :ensure t)

(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :ensure t)

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook 'lsp-format-buffer t t)
  (add-hook 'before-save-hook 'lsp-organize-imports t t))

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
  )

(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook 'lsp-go-install-save-hooks)
(add-hook 'go-mode-hook 'my-go-mode-hook)
