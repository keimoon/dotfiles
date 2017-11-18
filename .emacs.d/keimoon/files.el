(provide 'setup-files)

(setq large-file-warning-threshold 100000000) ;; size in bytes

(defvar backup-directory "~/.emacs-backups")
(if (not (file-exists-p backup-directory))
    (make-directory backup-directory t))
(setq
 make-backup-files t        ; backup a file the first time it is saved
 backup-directory-alist `((".*" . ,backup-directory)) ; save backup files in ~/.backups
 backup-by-copying t     ; copy the current file into backup directory
 version-control t   ; version numbers for backup files
 delete-old-versions t   ; delete unnecessary versions
 kept-old-versions 6     ; oldest versions to keep when a new numbered backup is made (default: 2)
 kept-new-versions 9 ; newest versions to keep when a new numbered backup is made (default: 2)
 auto-save-default t ; auto-save every buffer that visits a file
 auto-save-timeout 20 ; number of seconds idle time before auto-save (default: 30)
 auto-save-interval 200 ; number of keystrokes between auto-saves (default: 300)
 )

(setq
 dired-dwim-target t            ; if another Dired buffer is visible in another window, use that directory as target for Rename/Copy
 dired-recursive-copies 'always         ; "always" means no asking
 dired-recursive-deletes 'top           ; "top" means ask once for top level directory
 dired-listing-switches "-lha"          ; human-readable listing
 )

(add-hook 'dired-mode-hook 'auto-revert-mode)

(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))

(require 'dired-x)

(require 'wdired)
(setq
 wdired-allow-to-change-permissions t   ; allow to edit permission bits
 wdired-allow-to-redirect-links t       ; allow to edit symlinks
 )

(recentf-mode)
(setq
 recentf-max-menu-items 30
 recentf-max-saved-items 5000
 )
