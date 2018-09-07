(provide 'setup-go)

;; The following package must be installed
;; go get -u golang.org/x/tools/cmd/...
;; go get -u github.com/rogpeppe/godef/...
;; go get -u github.com/nsf/gocode
;; go get -u golang.org/x/tools/cmd/goimports
;; go get -u github.com/dougm/goflymake

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
  (local-set-key (kbd "C-c C-c") 'helm-company)

  (set (make-local-variable 'company-backends) '(company-go))
  )

(add-hook 'go-mode-hook 'my-go-mode-hook)
