;; Melpa
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; add custom dir to load path
(add-to-list 'load-path "~/.emacs.d/custom/")

;; YAML mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; line number on
(global-linum-mode t)
;;(setq linum-format "%d ")

;; projectile w/ grizzl
(require 'grizzl)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)
(global-set-key (kbd "<backtab>") 'projectile-find-file)

;; buffer name autocomplete via ido
(require 'ido)
(ido-mode t)

;; seti theme
(load-theme 'monokai t)

;; bind auto-indent to right brace
(global-set-key (kbd "C-M-]") 'indent-region)

;; silver searcher
(require 'ag)

;; Turn off tabs FOREVER
(setq-default indent-tabs-mode nil)

;; Use 2-space indent for JavaScript
(setq js-indent-level 2)

;; use bash environment in windowed mode
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))

;; git
(require 'git)
(require 'git-blame)

;; prevent silly initial splash screen
(setq inhibit-splash-screen t)

(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2)))
;; remove toolbar
(tool-bar-mode -1)
