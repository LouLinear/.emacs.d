;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(dolist (subdir '("init" "org_contrib"))
  (add-to-list 'load-path (expand-file-name subdir user-emacs-directory)))
;; melpa elpa
(require 'init-use-package)
;; general, evil mode + much more configurable spacemac like prefixes
(require 'init-keybindings)
;; ivy, swiper, counsel
(require 'init-ivy)
;; auto completion, company as frontend, probably will set up lsp
(require 'init-auto-completion)

;; evil-org, some agenda global entries
(require 'init-agenda)

;; flycheck, which key, moe theme
(require 'init-misc)

(require 'init-cpp)

;; (require 'init-clojure)
;; (require 'init-slack)

(setq org-startup-truncated nil)

;; other configs
(setq delete-old-versions t
      kept-new-versions 1
      kept-old-versions 1
      version-control t
      vc-make-backup-files t
      vc-follow-symlinks t)
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore) ; silent bell on mistakes
(setq sentence-end-double-space nil)
(setq-default fill-column 100) ; toggle wrapping text at this column
;; pretty
(set-frame-font "Mono 10")
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
;; roslaunch is xml
(add-to-list 'auto-mode-alist '("\\.launch\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))
;; linum
(global-linum-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(cuda-mode json-mode docker-tramp cmake-mode protobuf-mode yaml-mode yasnippet clang-format company-lsp lsp-ui lsp ccls slack websocket request oauth2 emojify circe alert evil-org evil-org-mode cider evil-magit magit ivy-hydra hydra moe-theme which-key flycheck company ace-window evil general counsel use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
