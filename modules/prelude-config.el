(defmacro double-tap-to-insert (to-char)
  "Create a function suitable for key binding.  It replaces
double consecutive occurrences of that character with TO-CHAR."
  `(lambda (cnt raw)
     (interactive "p\nP")
     (if (and (eq (preceding-char) last-command-event)
              (not raw))
         (progn
           (backward-delete-char 1)
           (insert ,to-char))
       (self-insert-command cnt))))

;; PATH변수 가져오기
(use-package exec-path-from-shell
  :ensure t
  :config 
  (setq exec-path-from-shell-check-startup-files nil)
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))
;;(setq exec-path (append exec-path '("/Volumes/Users/siabard/.local/bin" "/Volumes/Users/siabard/.cargo/bin")))

(provide 'prelude-config)
