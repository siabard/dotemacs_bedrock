(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :hook ((rust-mode . (lambda () (setq indent-tabs-mode nil)))
	 (rust-mode . (lambda () (global-prettify-symbols-mode))))
  :config
  (setq rust-format-on-save t))



(provide 'prelude-rust)
