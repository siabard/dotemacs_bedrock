(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package smartparens
  :ensure t
  :commands (smartparens-mode))


(when (string-equal system-type "darwin") ; Only for macOs
  ;; Dictionary file name
  (setenv "DICTIONARY" "en_US"))

(provide 'prelude-lang)
