; flymake
(require 'flymake)

(defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
(ad-activate 'flymake-post-syntax-check)

;; C++
(defun flymake-cc-init ()
    (let* ((temp-file   (flymake-init-create-temp-buffer-copy
			 'flymake-create-temp-inplace))
	   (local-file  (file-relative-name
			 temp-file
			 (file-name-directory buffer-file-name))))
          (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

(push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
(push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)


;;swift 
(defun flymake-swift-init ()
    (list "swiftCh" (list "" (flymake-init-create-temp-buffer-copy
			       'flymake-create-temp-inplace))))


(add-to-list 'flymake-allowed-file-name-masks
	     '("\\.swift\\'" flymake-swift-init))

(add-to-list 'flymake-err-line-patterns
	     '("\\(.*[0-9]+\\)"  1 1 1 1))

(add-hook 'swift-mode-hook
	    '(lambda ()
	   (flymake-mode t) ))



