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

(use-package dired
  :ensure nil
  :bind (:map dired-mode-map
         ("C-c C-p" . wdired-change-to-wdired-mode))
  :config
  ;; Always delete and copy recursively
  (setq dired-recursive-deletes 'always
        dired-recursive-copies 'always)

  ;; Show directory first
  (setq dired-listing-switches "-alh --group-directories-first")

  ;; Copy between buffers
  (setq dired-dwim-target t)
  )

(use-package dired-aux :ensure nil)
(use-package dired-x
  :ensure nil
  :demand
  :config
  (setq dired-omit-files
        (concat dired-omit-files
                "\\|^.DS_Store$\\|^.projectile$\\|^.git*\\|^.svn$\\|^.vscode$\\|\\.js\\.meta$\\|\\.meta$\\|\\.elc$\\|^.emacs.*"))
  )

(use-package wdired
  :ensure t
  :config
  (require 'wdired)
  (setq
   wdired-allow-to-change-permissions t   ; allow to edit permission bits
   wdired-allow-to-redirect-links t       ; allow to edit symlinks
   )
  )

(recentf-mode)
(setq
 recentf-max-menu-items 30
 recentf-max-saved-items 5000
 )
