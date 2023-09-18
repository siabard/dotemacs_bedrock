(use-package org
  :config
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t))

(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq org-agenda-files (list "~/doc/mdbook/org/todo.org" "~/doc/mdbook/doubleme/todo.org"))

(use-package org2blog
  :ensure t
  :config
     

  (setq org2blog/wp-use-sourcecode-shortcode nil)
  (setq org2blog/wp-blog-alist
	'(("myblog"
           :url "https://siabard.wordpress.com/xmlrpc.php"
           :username "siabard@gmail.com"))))


(use-package ob-mermaid
  :ensure t
  :config
  (setq ob-mermaid-cli-path "nvm exec --lts mmdc")
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((mermaid . t)
     (scheme . t))))


(provide 'prelude-org)
