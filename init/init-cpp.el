(use-package lsp-mode
  :commands lsp)
(use-package lsp-ui
  :commands lsp-ui-mode)
(use-package company-lsp
  :commands company-lsp)

(use-package ccls
  :config
  (setq ccls-initialization-options
	'(:index (:comments 0 :threads 2 :initialBlacklist ["."])
	  :completion (:detailedLabel t)))
  :hook
  ((c-mode c++-mode cuda-mode) . (lambda() (require 'ccls) (lsp))))

(require 'json)

(defun catkin-find-root-dir (current-directory)
    "walk up current file directory to find .catkin_workspace"
    (if (string-equal current-directory "/")
	(progn (message "unable to find catkin root!"))
      (if (and (directory-name-p current-directory)
	       (member ".catkin_workspace" (directory-files current-directory)))
	  ;; found .catkin_workspace, return current directory
	  (progn current-directory)
	;; recurse up
	(progn (catkin-find-root-dir (file-name-directory
				    (directory-file-name current-directory)))))))

(defun catkin-aggregate-compilation-db (catkin-root-dir)
  "goes into /path/to/catkin_root/build and aggregate all the compilation_commands.json
of each package into a single file"
  (let* ((json-files (directory-files-recursively
		      (concat catkin-root-dir "/build")
		      "compile_commands\.json"))
	 (json-alists (mapcar 'json-read-file json-files)))
    (write-region
     (json-encode (apply 'vconcat json-alists))
     nil
     (concat catkin-root-dir "/compile_commands\.json"))))


(defun catkin-compile-and-generate-compilation-db ()
  "compile catkin workspace and generate compilation commands for ccls"
  (interactive)
  (if (buffer-file-name)
      (let ((catkin-root-dir (catkin-find-root-dir (buffer-file-name))))
	(when catkin-root-dir
	  (let (default-directory catkin-root-dir)
	    (async-shell-command "catkin build -DCMAKE_EXPORT_COMPILE_COMMANDS=1"
				 "*catkin-make*")
	    (catkin-aggregate-compilation-db catkin-root-dir))))))

(provide 'init-cpp)
