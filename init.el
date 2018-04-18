(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
        ("marmalade" .  "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")))
(package-initialize)

;; -----------------------------------------------------------------------------
;; Use Package
;; -----------------------------------------------------------------------------

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;============================================================================
(setq use-package-always-ensure t
      use-package-always-defer t)
(require 'org)
(require 'ob-tangle)
(require 'use-package)

;; -----------------------------------------------------------------------------
;; Basics
;; -----------------------------------------------------------------------------

(use-package cl)
(require 'cl)

(defun user/load-configuration ()
  (interactive)
  (org-babel-load-file "~/.emacs.d/README.org"))

(bind-key "C-x p" 'user/load-configuration)

(if (file-exists-p "~/.emacs.d/README.el")
    (load-file "~/.emacs.d/README.el")
  (cl-letf (((symbol-function 'message) #'format))
    (org-babel-load-file (expand-file-name "~/.emacs.d/README.org"))))
