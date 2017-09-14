;;; hugsql-ghosts-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "hugsql-ghosts" "hugsql-ghosts.el" (22953 26632
;;;;;;  0 0))
;;; Generated autoloads from hugsql-ghosts.el

(autoload 'hugsql-ghosts-remove-overlays "hugsql-ghosts" "\
Remove all hugsql ghost overlays from the current buffer.

\(fn)" t nil)

(autoload 'hugsql-ghosts-display-query-ghosts "hugsql-ghosts" "\
Displays an overlay after (hugsql/def-db-fns ...) or (hugsql/def-sqlvec-fns ...) showing the names and docstrings of the generated functions from that file.

\(fn)" t nil)

(autoload 'hugsql-ghosts-install-hook "hugsql-ghosts" "\
Add a buffer local hook that refreshes the ghosts whenever the cider buffer is reloaded.

\(fn)" nil nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; hugsql-ghosts-autoloads.el ends here
