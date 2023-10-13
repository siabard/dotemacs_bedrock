(make-directory "~/.emacs_backups/" t)
(make-directory "~/.emacs_autosave/" t)

(setq auto-save-file-name-transforms `((".*" "~/.emacs_autosave/")))
(setq backup-directory-alias `(("." . "~/.emacs_backups/")))

(setq backup-by-copying t)

(setq show-trailing-whitespace t)

(provide 'prelude-default)
