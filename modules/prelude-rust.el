(defun rustic-mode-auto-save-hook ()
  "Enable auto-saving in rustic-mode buffers."
  (when buffer-file-name
    (setq-local compilation-ask-about-save nil)))


(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm
  (setq-local buffer-save-without-query t))


(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  
  :mode ("\\.rs\\'" . rustic-mode)
  :config
  (setq rustic-lsp-client 'lsp-mode
        rustic-lsp-server 'rust-analyzer
	rustic-format-on-save t
        rustic-analyzer-command '("~/.cargo/bin/rust-analyzer"))
  (define-key rustic-mode-map (kbd "[") (double-tap-to-insert ?\())
  (define-key rustic-mode-map (kbd "]") (double-tap-to-insert ?\)))
  (add-hook 'rustic-mode-hook #'company-mode)
  (add-hook 'rustic-mode-hook #'yas-minor-mode)
  (add-hook 'rustic-mode-hook #'subword-mode)
  (add-hook 'rustic-mode-hook #'electric-pair-mode)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook)
  (add-hook 'rustic-mode-hook 'rustic-mode-auto-save-hook)
  (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))
  )


(cl-delete-if (lambda (element) (equal (cdr element) 'rust-mode)) auto-mode-alist)
(cl-delete-if (lambda (element) (equal (cdr element) 'rustic-mode)) auto-mode-alist)
(add-to-list 'auto-mode-alist '("\\.rs$" . rustic-mode))

(provide 'prelude-rust)
