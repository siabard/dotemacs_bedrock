(make-directory "~/.emacs_backups/" t)
(make-directory "~/.emacs_autosave/" t)
(setq auto-save-file-name transform '((".*" "~/.emacs_autosave/" t)))
(setq backup-directory-alias '(("." . "~/.emacs_backups/")))

(setq backup-by-copying t)

(setq show-trailing-whitespace t)

(provide 'prelude-default)
