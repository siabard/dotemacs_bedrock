(unless (package-installed-p 'dart-mode)
  (package-install 'dart-mode))

(use-package dart-mode
  :after eglot
  :config
  (add-to-list 'eglot-server-programs '(dart-mode . ("dart" "language-server")))
  (add-hook 'dart-mode-hook 'eglot-ensure))



(use-package lsp-dart
  :after eglot
  :ensure t)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024))

(reformatter-define dart-format
  :program "dart"
  :args '("format"))

(with-eval-after-load "dart-mode"
  (define-key dart-mode-map (kbd "C-c C-o") 'dart-format-buffer))

(provide 'prelude-dart)
