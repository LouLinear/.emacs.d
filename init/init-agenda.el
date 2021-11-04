;; (use-package evil-org
;;   :ensure t
;;   :after evil
;;   :config
;;   (progn
;;     (add-hook 'org-mode-hook 'evil-org-mode)
;;     (add-hook 'evil-org-mode-hook
;; 	      (lambda () (evil-org-set-key-theme
;; 			  '(additional calendar navigation shift))))
;;     (require 'evil-org-agenda)
;;     (evil-org-agenda-set-keys)))

(general-define-key
 :states '(normal visual)
 :prefix "SPC o"
 :prefix-command 'org-agenda-entry-point
 "a" 'org-agenda
 "f" 'org-cycle-agenda-files
 "c" 'org-capture)

(setq org-capture-templates
      '(("t" "TODO" entry (file+headline "~/org/todo.org" "To Organize") "* TODO%?\n%T")

	("l" "Link" entry (file+headline "~/org/links.org" "Uncategorized")
	 "* %? %^L %^g \n" :prepend t)))

(setq org-agenda-files '("~/org/todo.org"))

(provide 'init-agenda)

