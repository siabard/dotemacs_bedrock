(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  :config
  (setq flycheck-cppcheck-standards "c++17")
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  :hook ((find-file . (lambda () (flymake-mode -1)))
	 (eglot--managed-mode . (lambda () (flymake-mode -1)))
	 ((c-or-c++-mode c++-mode c++-ts-mode) . (lambda () (setq flycheck-clang-language-standard "c++17")))
	 ((c-or-c++-mode c++-mode c++-ts-mode) . (lambda () (setq flycheck-gcc-language-standard "c++17")))
	 ((c-or-c++-mode c++-mode c++-ts-mode) . (lambda () (setq flycheck-clang-include-path
								(list (expand-file-name "/usr/local/include")
								      (expand-file-name "/opt/local/include")
								      ;; (expand-file-name "/usr/include")
								      )))))
  )

(flymake-mode -1)

(use-package flycheck-rust
  :ensure t
  :hook (	 (flycheck-mode . flycheck-rust-setup))
  )


(provide 'prelude-flycheck)
