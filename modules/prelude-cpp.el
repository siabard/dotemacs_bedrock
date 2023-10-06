(use-package clang-format
  :ensure t
  :config
  (setq clang-format-style "/usr/local/opt/llvm/bin/clang-format")
  (global-set-key (kbd "C-c i") 'clang-format-region)
  (global-set-key (kbd "C-c u") 'clang-format-buffer))

(provide 'prelude-cpp)
