;; front end, enable globally
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))
(provide 'init-auto-completion)
;; TODO: language specific backends
