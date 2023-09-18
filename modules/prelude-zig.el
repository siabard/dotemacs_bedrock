(use-package zig-mode
  :config
  (setq lsp-zig-zls-executable "~/.local/zls/zls")
  (unless (version< emacs-version "24")
    (autoload 'zig-mode "zig-mode" nil t)
    (add-hook 'zig-mode-hook #'lsp)
    (add-to-list 'auto-mode-alist '("\\.zig\\'" . zig-mode))))


(provide 'prelude-zig)
