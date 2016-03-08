;;; shm-reformat.el ---

;; Copyright (c) 2014 Chris Done. All rights reserved.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(require 'shm-ast)
(require 'hindent)

(defun shm-reformat-decl ()
  "Reformat the current declaration with `hindent/reformat-decl'
and then jump back to the right node."
  (interactive)
  (if (region-active-p)
      (call-interactively 'hindent-reformat-region)
      (let* ((current-pair (shm-current-node-pair))
         (index (car current-pair))
         (offset (- (point) (shm-node-start (cdr current-pair)))))
    (structured-haskell-mode -1)
    (hindent/reformat-decl)
    (structured-haskell-mode 1)
    (shm/reparse)
    (let ((new-current (elt (shm-decl-ast) index)))
      (goto-char (+ (shm-node-start new-current) offset))))))

(provide 'shm-reformat)
