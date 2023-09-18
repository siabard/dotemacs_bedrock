;; Clojure 관련 설정
(use-package cider :ensure t
  :config
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  (add-hook 'cider-mode-hook #'paredit-mode)
  (setq cider-repl-use-pretty-printing t)
  (setq cider-repl-display-help-banner nil)
  :bind (("M-r" . cider-namespace-refresh)
	 ("C-c r" . cider-repl-reset)
	 ("C-c ." . cider-reset-test-run-tests)))

;(require 'paredit)
(use-package rainbow-delimiters
  :config
  ;; Show parenthesis mode
  (show-paren-mode 1))

;; rainbow delimiters
;; To use only with specific modes
;; (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; To enable in all programming-related modes
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; paredit
;(add-hook 'clojure-mode-hook 'paredit-mode)
;(add-hook 'cider-mode-hook 'paredit-mode)

;; clojure-mode
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)

;; extentions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojurescript-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

;; auto complete
(use-package ac-cider
  :config
  (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
  (add-hook 'cider-mode-hook 'ac-cider-setup)
  (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'cider-mode)))


;; Auto complete
;; (use-package auto-complete-config
;;   :config
;;   (setq ac-delay 0.0)
;;   (setq ac-quick-help-delay 0.5)
;;   (ac-config-default))


;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (setq completion-at-point-functions '(auto-complete)))
;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; (add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)


;;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

;; 긴 라인을 보여줄 때 랙이 일어나는 것을 막기 위해 추가
(setq cider-repl-scroll-on-output nil)
(setq cider-show-eval-spinner nil)

;; 버퍼 지우기
(add-hook 'cider-repl-mode-hook
      '(lambda () (define-key cider-repl-mode-map (kbd "C-c M-b")
		    'cider-repl-clear-buffer)))

(provide 'prelude-clojure)
