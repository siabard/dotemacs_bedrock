(use-package tuareg)
(use-package utop)
(use-package eglot)
(use-package ocamlformat)
;;(use-package dune)
(use-package dune-format
  :ensure
  :config
  (add-hook 'dune-mode-hook 'dune-format-on-save-mode))



;; Add the opam lisp dir to the emacs load path
(add-to-list
 'load-path
 (replace-regexp-in-string
  "\n" "/share/emacs/site-lisp"
  (shell-command-to-string "opam var prefix")))

;; Automatically load utop.el
(autoload 'utop "utop" "Toplevel for OCaml" t)

;; Use the opam installed utop
(setq utop-command "opam exec -- utop -emacs")

(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)

(add-hook 'tuareg-mode-hook (lambda ()
  (define-key tuareg-mode-map (kbd "C-M-<tab>") #'ocamlformat)
  (add-hook 'before-save-hook #'ocamlformat-before-save)))

                                        ; Make company aware of merlin
(with-eval-after-load 'company
  (add-to-list 'company-backends 'merlin-company-backend))
                                        ; Enable company on merlin managed buffers
(add-hook 'merlin-mode-hook 'company-mode)
                                        ; Or enable it globally:
                                        ; (add-hook 'after-init-hook 'global-company-mode)



(let ((opam-share (ignore-errors (car (process-lines "opam" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    ;; Register merlin
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    ;; Automatically start it in OCaml buffers
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    (add-to-list 'eglot-server-programs '(merlin-mode . ("ocamllsp" "--args")))
    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)))


(setq auto-mode-alist 
      (append '(("\\.ml[ily]?$" . tuareg-mode)
	        ("\\.topml$" . tuareg-mode))
                  auto-mode-alist))


(use-package lsp-mode
  :config
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection
		     '("opam" "exec" "--" "ocamllsp"))
    :major-modes '(tuareg-mode merlin-mode caml-mode)
    :server-id 'ocamllsp)))

(provide 'prelude-ocaml)
