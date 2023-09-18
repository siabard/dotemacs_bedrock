(use-package lsp-pascal
  :ensure
  :config
  (add-hook 'pascal-mode-hook #'lsp)
  (add-hook 'opascal-mode-hook #'lsp)
  (setq lsp-pascal-command "~/.local/bin/pasls")
  (setq lsp-pascal-fpcdir "/usr/local/share/fpcsrc")
  (add-to-list 'auto-mode-alist
               '("\\.\\(pas\\|pp\\|lpr\\|dpr\\)\\'" . opascal-mode))
  (setq opascal-indent-level 2)
  (setq opascal-case-label-indent 2))

(load "~/doc/dotemacs/modules/pascal-mode+")
(load "~/doc/dotemacs/modules/delphi-imenu")
(load "~/doc/dotemacs/modules/delphi-misc")


(provide 'prelude-pascal)
