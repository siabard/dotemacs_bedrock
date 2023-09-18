;; .emacs 다시 읽기
(defun refresh_dotemacs ()
  (load-config-el "dotemacs.el"))

(defun is-linux-p ()
  (eq system-type 'gnu/linux))

;; Set $DICPATH to "$HOME/doc/spelling" for hunspell.
(setenv
 "DICPATH"
 (concat (getenv "HOME") "/doc/spelling"))
;; Tell ispell-mode to use hunspell.
(setq
 ispell-program-name
 "/usr/bin/hunspell")

(provide 'prelude-utils)
