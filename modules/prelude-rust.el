(use-package rust-mode
  :ensure t
  :requires (flycheck-rust)
  :mode ("\\.rs\\'" . rust-mode)
  :hook ((rust-mode . (lambda () (setq indent-tabs-mode nil
				   tab-width 4
				   c-basic-offset 4
				   fill-column 100)))
	 (rust-mode . (lambda () (global-prettify-symbols-mode))))
  :config
  (let ((dot-cargo-bin (expand-file-name "~/.cargo/bin")))
    (setq rust-rustfmt-bin (concat dot-cargo-bin "rustfmt")
	  rust-cargo-bin (concat dot-cargo-bin "cargo")
	  rust-format-on-save t)))

(provide 'prelude-rust)
