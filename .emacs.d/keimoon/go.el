(provide 'setup-go)

(defun my-go-mode-hook()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq gofmt-command "goimports")

  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v"))

  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-,") 'pop-tag-mark)
  (local-set-key (kbd "M-p") 'compile)
  (local-set-key (kbd "M-P") 'recompile)
  (local-set-key (kbd "M-]") 'next-error)
  (local-set-key (kbd "M-[") 'previous-error)
  (local-set-key (kbd "TAB") 'company-complete)

  (set (make-local-variable 'company-backends) '(company-go))
  )

(add-hook 'go-mode-hook 'my-go-mode-hook)
