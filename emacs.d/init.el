;;; init.el --- Where all the magic begins
;;
;; This file loads Org-mode and then loads the rest of our Emacs initialization from Emacs lisp
;; embedded in literate Org-mode files.

;; Load up Org Mode and (now included) Org Babel for elisp embedded in Org Mode files
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(let* ((org-dir (expand-file-name
                 "lisp" (expand-file-name
                         "org" (expand-file-name
                                "src" dotfiles-dir))))
       (org-contrib-dir (expand-file-name
                         "lisp" (expand-file-name
                                 "contrib" (expand-file-name
                                            ".." org-dir))))
       (load-path (append (list org-dir org-contrib-dir)
                          (or load-path nil))))
  ;; load up Org-mode and Org-babel
  (require 'org-install)
  (require 'ob-tangle))

;; load up all literate org-mode files in this directory
(mapc #'org-babel-load-file (directory-files dotfiles-dir t "\\.org$"))

;;; init.el ends here
(defun doremi-face-set (face spec)
      "Tell Customize that FACE has been set to value SPEC.
  SPEC is as for `defface'."
  (put face 'customized-face spec)
  (face-spec-set face spec)
  (message (substitute-command-keys
            "Use `\\[customize-customized]' to revisit changes.")))

;;(doremi-face-set org-hide ())
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "94188780ab35f08282a2c7e79a646768dc581bee03c3c4aafaa8f05b35cfe4ad" "ab054c1968d28b1733fa7bd9a49f6d3bcac763cd7c5b3a7b934efec338e93355" "286d168161af82971467f852c7e3d963752b210b596f8ac55ccf86bee1eb99b0" "0e49acb36ca3595bf70736de038e2c2812bd6260db43b8e39c64e1766a75f999" "46cc5904633524261f0c73f972581df45c3cc057a9d58ecd5f84e902af98f621" "328bc644192919d7311043e050aaf07c2165b4a813da54e71052c53952220986" "88e6a167fab86659077a74e4535c2957290e5ee7ce1ec4f123321994b0f86b44" "0bfdfc5deb6d28c128fc23739d9d2b399a4dc41df47d29100c7a57f68f9dbe1d" "bb50f77256b710727b7d31793020418811844951b269a2c6dbf256876a8b73ee" "e910160d5ea3f407c720176bc5d59b9152487b1c5f9824096a9183e51ad5a8dd" "6714dad99d221e649ceec1166881f656117cac242751d264189f9afd636e841b" "61d65c964d18d7f89a24c63929bd6d331ae149c2da313ff07116b6a27d821f00" "357e7652608a431a3b8e0763314ec757994a82a467c8bd37cc7d7ebdbd6bf96f" "4bacbd66566739f17c77f4359c489bb7c9717ca113abea63ac3f36b002e601e4" "4f6bbfc13ef3d08a480e52ab0c0d3f5d9d1bd47ca7a205285dfb67d93ed16fae" "06005886f2c960d01b3c9da9b32b4fa9e25933895bdd3ccf1ce1d4082a4e4a01" "7935c5879062951f629dc83642c288e2c115dad4a78dcf0de723e3b189f2767b" "cd83b37b85468fddd26cb790e10558be5ef778ee52b98e3600968938e1447321" "cd294064a9a82a463d6e6deca58bb2464837b2a0e0a2fbf2f3f1060a71adc5d9" "623c197c25bba4ef21b8de3e883a4db52db19a84988c01c8f6d2fc5919b46b13" "9ab634dcc9131f79016c96c4955298409649f6538908c743a8a9d2c6bc8321ef" "0eda8b3e1c6573f10f96df4fc5552ddde83fe23c2daa9223a6f5826570b81d5d" "01ce486c3a7c8b37cf13f8c95ca4bb3c11413228b35676025fdf239e77019ea1" default)))
 '(js3-auto-indent-p t)
 '(js3-consistent-level-indent-inner-bracket t)
 '(js3-curly-indent-offset 2)
 '(js3-enter-indents-newline t)
 '(js3-expr-indent-offset 2)
 '(js3-indent-level 0)
 '(js3-indent-on-enter-key t)
 '(js3-lazy-commas t)
 '(js3-paren-indent-offset 2)
 '(js3-square-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu ((t nil)))
 '(org-hide ((t (:background "color-16" :foreground "color-16")))))
