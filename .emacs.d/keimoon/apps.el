(provide 'setup-apps)

;; Workgroup
(require 'workgroups2)

;; Duplicate thing
(require 'duplicate-thing)
(global-set-key (kbd "M-c") 'duplicate-thing)

;; Volatile highlight
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; Smartparen
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

;; Clean aident mode
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Undo tree
(require 'undo-tree)
(global-undo-tree-mode)

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Expand Region
(require 'expand-region)
(global-set-key (kbd "M-m") 'er/expand-region)

;; Ibuffer-VC
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (vc-status 16 16 :left)
              " "
              filename-and-process)))

;; Projectile
(projectile-global-mode)

;; Dired+
(require 'dired+)

;; Recentf-ext
(require 'recentf-ext)

;; Ztree
(require 'ztree-diff)
(require 'ztree-dir)