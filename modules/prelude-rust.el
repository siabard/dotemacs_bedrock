(use-package rust-mode
  :ensure t
  :mode ("\\.rs\\'" . rust-mode)
  :config
  (add-hook 'rust-mode-hook
	    (lambda () (setq indent-tab-mode nil)))
  (setq rust-format-on-save t)
  (add-hook 'rust-mode-hook #'tree-sitter-mode)
  (add-hook 'rust-mode-hook
	    (lambda () (prettify-symbols-mode)))
  (add-hook 'rust-mode-hook 'eglot-ensure))


(use-package tree-sitter
  :ensure t
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))


(use-package tree-sitter-langs
  :ensure t)



(provide 'prelude-rust)
