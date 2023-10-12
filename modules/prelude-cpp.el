(use-package clang-format
  :ensure t
  :config
  (setq clang-format-style "/usr/local/opt/llvm/bin/clang-format")
  (global-set-key (kbd "C-c i") 'clang-format-region)
  (global-set-key (kbd "C-c u") 'clang-format-buffer))

;; c-or-c++ mode for header file

(use-package cc-mode
  :ensure t
  :mode ("\\.h\\'" . c-or-c++-mode))

(provide 'prelude-cpp)
