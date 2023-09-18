(use-package flycheck
  :ensure
  :config
  (add-hook 'c++-mode-hook
            (lambda () (setq flycheck-clang-language-standard "c++17")))
  )
(provide 'prelude-flycheck)
