;; 关闭欢迎界面
(setq inhibit-startup-message t) ;; setq == set quote

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Package Management
;; -----------------------
(require 'init-packages)

;; 全屏
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 高亮当前行
(global-hl-line-mode 1)

;; 安装主题
(load-theme 'monokai 1)

;; for emacs-w3m
(add-to-list `load-path "~/emacs-w3m/")
(require 'w3m-load)

;; for input method conflit
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式
;;(setq cursor-type 'bar)

;; 关闭启动关闭画面
(setq inhibit-splash-screen 1)

;; 关闭缩进
(electric-indent-mode -1)

;; 更改显示字体大小
;(set-face-attribute 'default nil :height 160)

;; 快速打开配置文件
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el")
)

;; 将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; 开启全局 Company (Complete Any thing) 补全
(global-company-mode 1)

;; 关闭自动生成备份文件
(setq make-backup-files nil)

;; 打开最近编辑过的文件)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; 选中删除替换
(delete-selection-mode 1)

;; 查找函数快捷键
(global-set-key (kbd "C-h C-f") 'find-function)

;; 查找变量快捷键
(global-set-key (kbd "C-h C-v") 'find-variable)

;; 查找快捷键位置
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(setq auto-mode-alist
  (append '(("\\.js\\'" . js2-mode)) auto-mode-alist)
)


;; 添加 org-mode 文本语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
