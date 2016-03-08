;;; less-css-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "../../../Dropbox/projects/docker-emacs/emacs.d/elpa/less-css-mode-20150511.319/less-css-mode"
;;;;;;  "less-css-mode.el" "817001b967d6752bdd2f5c116dafb072")
;;; Generated autoloads from less-css-mode.el

(autoload 'less-css-compile "../../../Dropbox/projects/docker-emacs/emacs.d/elpa/less-css-mode-20150511.319/less-css-mode" "\
Compiles the current buffer to css using `less-css-lessc-command'.

\(fn)" t nil)

(autoload 'less-css-mode "../../../Dropbox/projects/docker-emacs/emacs.d/elpa/less-css-mode-20150511.319/less-css-mode" "\
Major mode for editing LESS files, http://lesscss.org/
Special commands:
\\{less-css-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))

;;;***

;;;### (autoloads nil "less-css-mode" "../../../../../../.emacs.d/elpa/less-css-mode-20150511.319/less-css-mode.el"
;;;;;;  "817001b967d6752bdd2f5c116dafb072")
;;; Generated autoloads from ../../../../../../.emacs.d/elpa/less-css-mode-20150511.319/less-css-mode.el

(autoload 'less-css-compile "less-css-mode" "\
Compiles the current buffer to css using `less-css-lessc-command'.

\(fn)" t nil)

(autoload 'less-css-mode "less-css-mode" "\
Major mode for editing LESS files, http://lesscss.org/
Special commands:
\\{less-css-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))

;;;***

;;;### (autoloads nil nil ("../../../../../../.emacs.d/elpa/less-css-mode-20150511.319/less-css-mode-autoloads.el"
;;;;;;  "../../../../../../.emacs.d/elpa/less-css-mode-20150511.319/less-css-mode.el"
;;;;;;  "less-css-mode.el") (22232 37014 940009 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; less-css-mode-autoloads.el ends here
