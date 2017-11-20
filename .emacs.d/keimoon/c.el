(provide 'setup-c)

(setq c-default-style "linux" ; set style to "linux"
      c-basic-offset 4)

(setq gdb-many-windows t        ; use gdb-many-windows by default
      gdb-show-main t)          ; Non-nil means display source file containing the main routine at startup

;; rtags
(require 'rtags)
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)

(require 'helm-rtags)
(setq rtags-display-result-backend 'helm)

;; cmake ide
(cmake-ide-setup)
