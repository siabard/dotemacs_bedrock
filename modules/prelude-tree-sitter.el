(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter)

(use-package treesit-auto
  :demand t
  :config
  (global-treesit-auto-mode))


(provide 'prelude-tree-sitter)
