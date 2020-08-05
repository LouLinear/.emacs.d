;;; #init-ivy.el
(use-package hydra)
(use-package ivy
  :init (ivy-mode 1)
  :diminish ivy-mode
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 20)
  (setq ivy-count-format "%d/%d "))
(use-package ivy-hydra)

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

;; more counsel bindings
(general-define-key
 :states '(normal visual)
 :prefix "SPC"
 "f" 'counsel-find-file
 "r" 'counsel-recentf  ; search for recently edited
 "/" 'counsel-rg       ; Use ag for regexp
 "G" 'counsel-git      ; search for files in git repo
 "W" 'hydra-window-menu/body
 )

;; hydra bindings for windows (panes)
(defhydra hydra-window-menu (:color pink
				    :hint nil)
  "
Move Splitter   ^^^Rotate     ^^^Split       ^^^^^Jump to
--------------------------------------------------------
    ^_k_^          _r_: down    ^^_|_: vsplit    ^^_w_: ace-window^
  _h_   _l_        _R_: up      ^^_\__: hsplit    ^_o_: other-window^
    ^_j_^            ^^^^         _d_: delete
"
  ("q" nil "done")
  ("j" hydra-move-splitter-down)
  ("k" hydra-move-splitter-up)
  ("h" hydra-move-splitter-left)
  ("l" hydra-move-splitter-right)
  ("r" evil-window-rotate-upwards)
  ("R" evil-window-rotate-downwards)
  ("|" evil-window-vsplit)
  ("_" evil-window-split)
  ("d" evil-window-delete)
  ("w" ace-window)
  ("o" other-window))

;; TODO: Generalize using macros
(require 'windmove)
(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra-move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))

(provide 'init-ivy)
;;; init-ivy.el ends here.
