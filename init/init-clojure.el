(use-package cider
  :ensure t
  :config
  (general-define-key
   :keymap 'cider-mode-map
   :states '(normal visual)
   :prefix "SPC c"
   :prefix-command 'my-cider
   "l" 'cider-eval-last-sexp
   "i" 'cider-insert-last-sexp-in-repl
   "P" 'cider-pprint-eval-last-sexp
   "r" 'cider-eval-region
   "e" 'cider-load-buffer
   "f" 'cider-load-file
   "x" 'cider-interrupt
   "R" 'cider-ns-refresh
   "z" 'cider-switch-to-repl-buffer
   "Z" 'cider-load-buffer-and-switch-to-repl-buffer
   "." 'cider-find-var
   "," 'cider-pop-back
   "M-d" 'cider-describe-connection
   "d" 'cider-doc
   "a" 'cider-apropos
   "h" 'cider-cheatsheet
   ))



(provide 'init-clojure)
