;;; workgroups2-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "workgroups2" "workgroups2.el" (0 0 0 0))
;;; Generated autoloads from workgroups2.el

(autoload 'workgroups-mode "workgroups2" "\
Turn `workgroups-mode' on and off.
ARG is nil - toggle
ARG >= 1   - turn on
ARG == 0   - turn off
ARG is anything else, turn on `workgroups-mode'.

\(fn &optional ARG)" t nil)

(autoload 'wg-open-workgroup "workgroups2" "\
Open specific workgroup by GROUP-NAME.

\(fn &optional GROUP-NAME)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "workgroups2" '("buffer-list" "wg-" "workgroups-mode")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; workgroups2-autoloads.el ends here
