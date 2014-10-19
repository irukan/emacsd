(add-to-list 'load-path' "~/.emacs.d")
(add-to-list 'load-path' "~/.emacs.d/elisp")

(load "init-mac")
(load "init-flymake")
(load "init-ruby")

(load "init-TabDisplay")
(load "init-keyBind")


(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)



;行番号の表示
(global-linum-mode t)
(global-set-key [f6] 'linum-mode)
(setq linum-format "%4d |")

;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")


;自動括弧入力
(electric-pair-mode 1)

; 改行後インデント
(global-set-key "\C-m" 'newline-and-indent)

; 対応する括弧をハイライト
(show-paren-mode t)


