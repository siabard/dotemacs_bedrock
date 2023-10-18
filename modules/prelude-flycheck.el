(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  :config
  (setq flycheck-cppcheck-standards "c++17")
  :hook ((find-file . (lambda () (flymake-mode -1)))
	 (eglot--managed-mode . (lambda () (flymake-mode -1)))
	 ((c-or-c++-mode c++-mode c++-ts-mode) . (lambda () (setq flycheck-clang-language-standard "c++17")))
	 ((c-or-c++-mode c++-mode c++-ts-mode) . (lambda () (setq flycheck-gcc-language-standard "c++17")))
	 ((c-or-c++-mode c++-mode c++-ts-mode) . (lambda () (setq flycheck-clang-include-path
								(list (expand-file-name "/usr/local/include")
								      (expand-file-name "/opt/homebrew/include")
								      (expand-file-name "/usr/include")
								      (expand-file-name "/usr/local/opt/llvm/include/c++/v1"))))))
  )

(flymake-mode -1)

(provide 'prelude-flycheck)
