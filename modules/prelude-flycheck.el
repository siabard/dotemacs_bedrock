(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  :config
  (setq flycheck-cppcheck-standards "c++17")
  :hook ((find-file-hook . (lambda () (flymake-mode -1)))
	 ((c-or-c++-mode-hook c++-mode-hook) . (lambda () (setq flycheck-clang-language-standard "c++17")))
	 ((c-or-c++-mode-hook c++-mode-hook) . (lambda () (setq flycheck-gcc-language-standard "c++17"))))
  )

(flymake-mode -1)

(provide 'prelude-flycheck)
