; ;; SDK Place
(defvar xcode:sdkver "8.0")
(defvar xcode:sdkpath "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer")
(defvar xcode:sdk (concat xcode:sdkpath "/SDKs/iPhoneSimulator" xcode:sdkver ".sdk"))

;; auto-complete-mode for Objective-C
(when (require 'auto-complete-config nil t)
       (add-to-list 'ac-dictionary-directories
		"~/.emacs.d/ac-dict")
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(ac-config-default))

(setq ac-modes (append ac-modes '(objc-mode)))
(setq ac-modes (append ac-modes '(swift-mode)))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/auto-complete-clang.el")) ;; Set your own Path to auto-complete-clang.el
(setq ac-clang-flags (list "-D__IPHONE_OS_VERSION_MIN_REQUIRED=30200" "-x" "objective-c" "-std=gnu99" "-isysroot" xcode:sdk "-I." "-F.." "-fblocks"))
(require 'auto-complete-clang)
;; (setq ac-clang-prefix-header "stdafx.pch")
;; (setq ac-clang-flags '("-w" "-ferror-limit" "1"))
;(setq clang-completion-flags (list "-Wall" "-Wextra" "-fsyntax-only" "-ObjC" "-std=c99" "-isysroot" "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator6.0.sdk" "-I." "-F.." "-D__IPHONE_OS_VERSION_MIN_REQUIRED=30200"))
(add-hook 'objc-mode-hook
	            (lambda () (setq ac-sources (append '(ac-source-clang
			                                  ac-source-yasnippet
							  ac-source-gtags)
							  ac-sources))))

;XCode Commnd + R
(defun xcode:buildandrun ()
   (interactive)
    (do-applescript
       (format
	   (concat
	        "tell application \"Xcode\" to activate \r"
		    "tell application \"System Events\" \r"
		        "     tell process \"Xcode\" \r"
			    "          key code 15 using {command down} \r"
			        "    end tell \r"
				    "end tell \r"
				        ))))

(add-hook 'swift-mode-hook
	           (lambda ()
		    (define-key objc-mode-map (kbd "C-c C-r") 'xcode:buildandrun) ))
