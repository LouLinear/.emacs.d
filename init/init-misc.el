;; this is rather annoying. decide whether to keep
(use-package flycheck)

(use-package ace-window
  :ensure t
  :after general
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (general-define-key
   :states '(normal visual)
   :prefix "SPC"
   "w" 'ace-window))

;; which key, make shortcuts discoverable
(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
    which-key-side-window-max-width 0.33
    which-key-idle-delay 0.05)
  :diminish which-key-mode)

;; pretty 
(use-package moe-theme
  :ensure t
  :config
  (moe-dark))

(use-package magit
  :ensure t
  :after general
  :config
  (general-define-key
   :states '(normal visual)
   :prefix "SPC"
   "g" 'magit-status))

(use-package evil-collection
  :config
  (evil-collection-init 'magit))

(provide 'init-misc)
