;; look & feel
(add-to-list 'custom-theme-load-path "~/doc/dotemacs/themes")
;;(load-theme 'dracula t)
;;(load-theme 'nimbus t)
(load-theme 'zenburn t)

;; line number
;;(require 'nlinum )
;;(when (version<= "26.0.50" emacs-version )
;;  (global-display-line-numbers-mode))

 (when window-system
      (set-frame-position (selected-frame) 0 0)
      (set-frame-size (selected-frame) 160 50))

(provide 'prelude-looknfeel)
