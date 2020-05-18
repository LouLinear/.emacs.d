;; all the keybindings (evil, general, ace window...)
(use-package evil
  :ensure t
  :config (evil-mode 1))

(use-package general
  :ensure t
  :after evil
  :config
  (general-evil-setup t)
  (general-define-key
   :states '(normal visual)
   :prefix "SPC"
   "b" 'switch-to-buffer
   "e" 'eval-buffer
   "|" 'evil-window-vsplit
   "_" 'evil-window-split
   "0" 'evil-window-delete))

(provide 'init-keybindings)
