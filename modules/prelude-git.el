;;; prelude-git.el --- magit prelude module
;;; Commentary:
;;; magit GIT 세팅

(use-package magit
  :ensure t
  :commands (magit-status)
  :bind (("C-x g" . magit-status))
  :config
  (setf (alist-get 'unpushed magit-section-initial-visibility-alist) 'show))

(use-package forge
  :ensure t
  :after magit)

(provide 'prelude-git)
