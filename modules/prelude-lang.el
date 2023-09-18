(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package smartparens
  :commands (smartparens-mode))


(when (string-equal system-type "darwin") ; Only for macOs
  ;; Dictionary file name
  (setenv "DICTIONARY" "en_US"))

(provide 'prelude-lang)
