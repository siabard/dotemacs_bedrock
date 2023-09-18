(unless (package-installed-p 'elixir-mode)
  (package-install 'elixir-mode))

(use-package elixir-mode
  :ensure t
  :config
  (setq lsp-elixir-local-server-command "~/.local/bin/language_server.sh")
  (add-hook 'elixir-mode-hook 'eglot-ensure)
  (add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t))))



(provide 'prelude-elixir)
