(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      '(("gnu-cn" . "http://elpa.zilongshanren.com/gnu/")
        ("melpa-cn" . "http://elpa.zilongshanren.com/melpa/")
        ("melpa-stable-cn" . "	http://elpa.zilongshanren.com/melpa-stable/")
        ("marmalade-cn" . "http://elpa.zilongshanren.com/marmalade/")
        ("org-cn" . "http://elpa.zilongshanren.com/org/")))
(package-initialize)


;; -----------------------------------------------------------------------------
;; Use Package
;; -----------------------------------------------------------------------------

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;默认文件编码
(prefer-coding-system 'utf-8)

;;修改mac的comm按键为super按键
(setq mac-command-modifier 'super)
;;绑定alt为emta按键
(setq mac-option-modifier 'meta)
;;;绑定control为c按键
(setq mac-control-modifier 'control)

;;设置各种文件编码
(setq buffer-file-coding-system 'utf-8-unix
      default-file-name-coding-system 'utf-8-unix
      default-keyboard-coding-system 'utf-8-unix
      default-process-coding-system '(utf-8-unix . utf-8-unix)
      default-sendmail-coding-system 'utf-8-unix
      default-terminal-coding-system 'utf-8-unix)

;;递归删除和递归拷贝
(setq dired-recursive-deletes 'always
      dired-recursive-copies 'always)

;;设置鼠标滚动
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't)


;;替换yes/no为y/n
(fset 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil)

;;自定义界面
(global-auto-revert-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-linum-mode -1)
;;编辑下选择替换
(delete-selection-mode 1)
;;高亮当前行
(global-hl-line-mode 1)
;;-------------------------------------------------
;;绑定自定义快捷键
;;-------------------------------------------------

;; C-x 2 | 3
;; C-x 1 current
;; C-x 0 close current
;; C-x o

;; C-g quit
;; C-h f  function -> key
;; C-h k  key -> function
(bind-key "s-o" 'find-file global-map)
(bind-key "s-s" 'save-buffer global-map)
(bind-key "s-c" 'kill-ring-save global-map)
(bind-key "s-v" 'yank global-map)
(bind-key "s-x" 'kill-region global-map)
(bind-key "s-e" 'switch-to-buffer global-map)
(bind-key "s-w" 'kill-buffer global-map)
(bind-key "s-z" 'undo global-map)
(bind-key "<escape>" 'keyboard-escape-quit global-map)


;;项目管理
(use-package projectile
  :ensure t
  :init
  (projectile-mode))

;;设置行高
(setq line-spacing 3)

(use-package counsel
  :ensure t
  :bind
  (("C-c g" . counsel-git)
   ("C-c G" . counsel-git-grep)
   ("C-c C-s" . swiper)
   ("C-c m" . counsel-imenu)
   ("C-c A" . counsel-ag)
   :map ivy-minibuffer-map
   ("<tab>" . ivy-alt-done)
   ("<escape>" . minibuffer-keyboard-quit)
   ("C-r" . counsel-expression-history)))


(use-package counsel-projectile
  :ensure t 
  :init
  (setq projectile-completion-system 'ivy)
  (counsel-projectile-on))


(use-package js2-mode
  :ensure t)
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


;;补全
(use-package ivy
  :ensure t
  :init
  (ivy-mode 1))

;;目录树
(use-package neotree
  :ensure t
  :bind
  (("s-\\" . neotree-toggle)))

;;状态栏
(setq ns-use-srgb-colorspace nil)
;;主题
(use-package monokai-theme
  :ensure t)
;;主题
(use-package jazz-theme
  :ensure t)

(use-package solarized-theme
  :ensure t)

(use-package spacemacs-theme
  :ensure t)

(use-package atom-one-dark-theme
  :ensure)

(use-package zenburn-theme
  :ensure t
  :init
  (load-theme 'zenburn t))


;;状态栏//smart mode line
(use-package powerline
  :ensure t
  :init
  (powerline-center-theme))
;;括号
(use-package paredit
  :ensure t
  :init
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode))

;;clojure支持
(use-package clojure-mode
  :ensure t)

;;clojure repl支持
(use-package cider
  :ensure t
  :bind 
  (:map cider-mode-map
        ("C-c <tab>" . cider-inspect-last-result)
        ("<s-return>" .  cider-eval-last-sexp) 
        ("<C-return>" .  cider-eval-defun-at-point))
  :init
  (setq cider-prompt-for-symbol nil)
  (setq cider-lein-command "/usr/local/bin/lein"))

;;命令修复
(use-package exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))

(use-package aggressive-indent
  :ensure t
  :init
  (add-hook 'clojure-mode-hook 'aggressive-indent-mode)
  (add-hook 'clojure-repl-mode-hook 'aggressive-indent-mode)
  (add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode))
;;切换窗口
(use-package ace-window
  :ensure t
  :bind
  (("C-x C-x" . ace-window))
  :init
  (setq aw-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n)))

;;彩虹括号
(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode))

;;远程nrepl
(use-package monroe
  :ensure t)

;;git修改该提示
(use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode))


;;org-mode加强
(use-package org
  :ensure t
  :init
  (setq org-src-fontify-natively t)
  (setq org-hide-leading-stars t)
  (setq org-log-into-drawer t)
  (setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
  (add-hook 'org-mode-hook
            (lambda ()
              (setq org-src-ask-before-returning-to-edit-buffer nil)
              (org-indent-mode 1))))

(setq org-ellipsis "⤵")
(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode))

(eval-after-load "org"
  '(require 'ox-md nil t))


(use-package ag
  :ensure t)


(defun user/company-clojure-init ()
  (bind-key "TAB" 'company-indent-or-complete-common clojure-mode-map)
  (bind-key "<tab>" 'company-indent-or-complete-common clojure-mode-map))

(defun user/company-cider-repl-init ()
  (bind-key "<tab>" 'company-complete-common cider-repl-mode-map))

(defun user/company-eshell-init ()
  (bind-key "<tab>" 'company-complete-common eshell-mode-map))

(defun user/company-elisp-init ()
  (bind-key "TAB" 'company-indent-or-complete-common emacs-lisp-mode-map)
  (bind-key "<tab>" 'company-indent-or-complete-common emacs-lisp-mode-map))

(use-package company
  :ensure t
  :bind
  (:map company-active-map
        ("<escape>" . company-abort)
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous))
  :init
  (add-hook 'emacs-lisp-mode-hook #'user/company-elisp-init)
  (add-hook 'clojure-mode-hook #'user/company-clojure-init)
  (add-hook 'eshell-mode-hook #'user/company-eshell-init)
  (add-hook 'cider-repl-mode-hook #'user/company-cider-repl-init)
  (add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
  (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
  (setq company-idle-delay nil)
  (global-company-mode 1))

(use-package magit
  :ensure t
  :bind
  (("C-x M-g" . magit-dispatch-popup))
  :init
  (setq magit-completing-read-function 'ivy-completing-read)
  (global-magit-file-mode t))


;;设置备份文件
(setq backup-directory-alist `(("." . "~/.backup")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)
;;去除烦人的备份
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;补全
(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config
  (unbind-key "<tab>" yas-minor-mode-map)
  (unbind-key "TAB" yas-minor-mode-map))


;;////////=_= 热加载依赖,and so...
(use-package clj-refactor
  :ensure t
  :init
  (cljr-add-keybindings-with-prefix "C-,")
  (add-hook 'clojure-mode-hook #'clj-refactor-mode)
  (add-hook 'clojure-mode-hook #'yas-minor-mode))

;;透明度
(global-set-key (kbd "<f10>") 'loop-alpha)
(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))  
(defun loop-alpha ()  
  (interactive)  
  (let ((h (car alpha-list)))                ;; head value will set to  
    ((lambda (a ab)  
       (set-frame-parameter (selected-frame) 'alpha (list a ab))  
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))  
       ) (car h) (car (cdr h)))  
    (setq alpha-list (cdr (append alpha-list (list h))))))

(set-default-font "MonoxLight-18")

;;xwindowd窗口提示大小
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "green" :weight normal :height 4.5))))
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

(put 'dired-find-alternate-file 'disabled nil)

;;删除文件
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))
;;绑定删除快捷键
(global-set-key (kbd "C-c D")  'delete-file-and-buffer)


;;状态栏配色
(defun graphic-powerline-config ()
  "powerline setting for graphic"
  (interactive)
  (progn
    (setq powerline-arrow-shape 'arrow)
    (custom-set-faces
     '(mode-line ((t (:foreground "white" :background "#0044cc" :box nil))))
     '(mode-line-inactive ((t (:foreground "white" :background "#262626" :box nil))))
     )
    (setq powerline-color1 "#0088cc")
    (setq powerline-color2 "white")
    )
  )
;;状态栏配色
(defun terminal-powerline-config()
  " powerline setting for terminal"
  (interactive)
  (setq powerline-arrow-shape 'arrow)
  (setq powerline-color1 "grey22")
  (setq powerline-color2 "grey22") 
  (custom-set-faces
   '(mode-line ((t (:foreground "grey44" :background "grey22" :box nil))))
   '(mode-line-inactive ((t (:foreground "grey22" :background "grey44" :box nil))))
   ))
(graphic-powerline-config)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a4c9e536d86666d4494ef7f43c84807162d9bd29b0dfd39bdf2c3d845dcc7b2e" default))))
