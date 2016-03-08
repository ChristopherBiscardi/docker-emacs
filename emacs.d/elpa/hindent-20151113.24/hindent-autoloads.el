;;; hindent-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "hindent" "hindent.el" (22224 6501 0 0))
;;; Generated autoloads from hindent.el

(autoload 'hindent-mode "hindent" "\
Indent code with the hindent program.

Provide the following keybindings:

\\{hindent-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'hindent-reformat-decl "hindent" "\
Re-format the current declaration by parsing and pretty
  printing it. Comments are preserved, although placement may be
  funky.

\(fn)" t nil)

(autoload 'hindent-reformat-buffer "hindent" "\
Reformat the whole buffer.

\(fn)" t nil)

(autoload 'hindent-reformat-decl-or-fill "hindent" "\
Re-format current declaration, or fill paragraph.

Fill paragraph if in a comment, otherwise reformat the current
declaration.

\(fn JUSTIFY)" t nil)

(autoload 'hindent-reformat-region "hindent" "\
Reformat the given region, accounting for indentation.

\(fn BEG END)" t nil)

(autoload 'hindent/reformat-decl "hindent" "\
See `hindent-reformat-decl'.

\(fn)" nil nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; hindent-autoloads.el ends here
