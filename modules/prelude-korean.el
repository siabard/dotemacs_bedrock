;;(set-input-method "korean-hangul")
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)

(when (or (eq system-type 'gnu/linux)
	  (eq system-type 'darwin))
  ;; defult Latin font :face
  (set-face-attribute 'default nil :family "Hack")
  (set-face-attribute 'default nil :height 120)
  (set-fontset-font t 'hangul (font-spec :name "D2Coding")))

;; 한글과 영문의 폰트 스케일 맞추기 - orgmode 테이블 깨지지않게하기
(setq face-font-rescale-alist 
      '((".*hiragino.*" . 1.2)
	("D2Coding" . 1.2307692307692308)))

(provide 'prelude-korean)
