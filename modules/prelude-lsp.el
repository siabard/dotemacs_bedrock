(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c-or-c++-mode 'eglot-ensure)

(use-package modern-cpp-font-lock
  :ensure t)

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)


(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '((c++-mode c-mode c-or-c++-mode) .
					( "clangd"
					  ;;;; "-std=c++17"
					  "--log=verbose"
					  "--enable-config"
					  "--background-index"
					  "--clang-tidy"
					  "--cross-file-rename"
					  "--completion-style=detailed"
					  "--pch-storage=memory"
					  "--header-insertion=never"
					  "--header-insertion-decorators=0"))))

(provide 'prelude-lsp)
;;; prelude-lsp.el ends here
