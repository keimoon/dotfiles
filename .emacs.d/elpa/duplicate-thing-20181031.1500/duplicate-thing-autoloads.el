;;; duplicate-thing-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "duplicate-thing" "duplicate-thing.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from duplicate-thing.el

(autoload 'duplicate-thing "duplicate-thing" "\
Duplicate line or region N times.
If it has active mark, it will expand the selection and duplicate it.
If it doesn't have active mark, it will select current line and duplicate it.

\(fn N)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "duplicate-thing" '("duplicate-thing-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; duplicate-thing-autoloads.el ends here
