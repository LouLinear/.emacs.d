;;; #init-ivy.el

(use-package ivy
  :diminish (ivy-mode . "")
  :init (ivy-mode 1) ; globally at startup
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 20)
  (setq ivy-count-format "%d/%d "))

;; counsel overrides some basic Emacs commands with a more user friendly version
(use-package counsel
  :bind* ; load when pressed
  (("M-x"     . counsel-M-x)
   ("C-s"     . swiper)
   ("C-c j"   . counsel-git-grep) ; search for regexp in git repo
   ("C-x l"   . counsel-locate)
   ("<f1> f"  . counsel-describe-function)
   ("<f1> v"  . counsel-describe-variable)
   ("<f1> l"  . counsel-find-library)
   ("<f2> i"  . counsel-info-lookup-symbol)
   ("<f2> u"  . counsel-unicode-char)
   ("C-c C-r" . ivy-resume)))     ; Resume last Ivy-based completion

(general-define-key
 :states '(normal visual)
 :prefix "SPC"
 "f" 'counsel-find-file
 "r" 'counsel-recentf  ; search for recently edited
 "/" 'counsel-ag       ; Use ag for regexp
 "G" 'counsel-git      ; search for files in git repo
 )

(provide 'init-ivy)
;;; init-ivy.el ends here.
