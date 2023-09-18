(use-package prettier-js
  :config
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'js2-mode-hook #'lsp)
  (setq lsp-clients-typescript-tls-path "/home/siabard/.nvm/versions/node/v16.15.1/bin/typescript-language-server")

  (add-to-list 'auto-mode-alist
               '("\\.\\(jsx\\|js\\)\\'" . js2-mode)))


(provide 'prelude-javascript)
