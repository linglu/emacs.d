
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (package-initialize)
)

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
  ;; -- Auto Completion --
  company
  ;; -- Better Editer --
  hungry-delete
  swiper
  counsel
  smartparens
  ;; -- Major Mode --
  js2-mode
  ;; -- Minor Mode --
  nodejs-repl
  exec-path-from-shell
  ;; -- Themes --
  monokai-theme
) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)
    )
)

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg)
    )
  )
)

;; 文件末尾
(provide 'init-packages)
