;; Common Lisp 로딩
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(use-package slime)
(use-package slime-autoloads)


(setq inferior-lisp-program
      (cond ((eq system-type 'gnu/linux) "/usr/bin/sbcl")
            ((eq system-type 'darwin) "/usr/local/bin/sbcl")))


(add-hook 'lisp-mode-hook #'paredit-mode)
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

;; hyper spec
(load "/home/siabard/quicklisp/clhs-use-local.el" t)
;; (setq common-lisp-hyperspec-root
;;      (concat "file://" (expand-file-name "~/doc/common-lisp/HyperSpec/")))

(setq browse-url-handlers '(("http://lispworks.com" . eww-browse-url)
			    ("file://" . eww-browse-url)
			    ("" . browse-url-default-browser)))

(load (expand-file-name "~/quicklisp/slime-helper.el"))

(use-package ac-slime
  :ensure t
  :config
  (add-hook 'slime-mode-hook 'set-up-slime-ac)
  (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'slime-repl-mode)))

(provide 'prelude-lisp)
