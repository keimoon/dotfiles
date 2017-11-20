(provide 'setup-c)

(setq c-default-style "linux" ; set style to "linux"
      c-basic-offset 4)

(setq gdb-many-windows t        ; use gdb-many-windows by default
      gdb-show-main t)          ; Non-nil means display source file containing the main routine at startup

;; rtags
(require 'rtags)
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(rtags-enable-standard-keybindings)

(require 'helm-rtags)
(setq rtags-display-result-backend 'helm)

(require 'company-rtags)
(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))

;; cmake ide
(cmake-ide-setup)
