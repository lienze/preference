;; melpa package
(require 'package)
(setq package-archives '(("gnu"  .  "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

;;== tab
;(setq tab-always-indent nil)

;;== View line number
(global-linum-mode 1)	;always show line numbers
;(setq linum-format "%04d| ")	;set format
(setq linum-format "%d| ")	  ;set format

;;== Show whitespace/tab
;(setq whitespace-style '(face indentation::tab indentation::space tabs tab-mark trailing))
(global-whitespace-mode 1)
(setq whitespace-style '(tab-mark newline-mark))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(git-gutter))
 '(whitespace-style
   '(face trailing newline empty space-after-tab::tab space-after-tab::space space-after-tab space-before-tab::tab space-before-tab::space space-before-tab tab-mark newline-mark)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
