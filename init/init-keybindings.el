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
   "0" 'evil-window-delete
   "1" 'delete-other-windows
   "k" 'kill-buffer))

(dolist (key '("\C-xk" "\C-xb" "\C-xf"         ; buffers
	       "\C-x0" "\C-x1" "\C-x2" "\C-x3" ; split windows
	       "\C-w"                          ; evil windows (replaced with hydra)
	       ))
  (global-unset-key key))

(provide 'init-keybindings)
