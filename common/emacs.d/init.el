;; melpa package
(require 'package)
(setq package-archives '(("gnu"  .  "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
    t
    (if (or (assoc package package-archive-contents) no-refresh)
      (if (boundp 'package-selected-packages)
        ;; Record this as a package the user installed explicitly
        (package-install package nil)
        (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
    (require-package package min-version no-refresh)
    (error
      (message "Couldn't install optional package `%s': %S" package err)
      nil)))

(require 'init-elpa)

;;=== UI
(menu-bar-mode 0)
(tool-bar-mode 0)

;;=== theme
;(load-theme 'gruvbox-dark-soft t)
(load-theme 'molokai t)

;;=== tab
;(setq tab-always-indent nil)

;;=== View line number
(global-linum-mode 1)		;always show line numbers
;(setq linum-format "%04d| ")	;set format
(setq linum-format "%d| ")	;set format

;;=== Show whitespace/tab
;(setq whitespace-style '(face indentation::tab indentation::space tabs tab-mark trailing))
(global-whitespace-mode 1)
;(setq whitespace-style '(tab-mark newline-mark))

;;=== global key-maps
(global-set-key(kbd "C-x b") 'helm-buffers-list)
(global-set-key(kbd "C-x o") (kbd "M-o"))

;;=== backup
(setq make-backup-files nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" default))
 '(package-selected-packages
   '(molokai-theme ggtags imenu-list helm gruvbox-theme neotree auto-complete git-gutter))
 '(safe-local-variable-values
   '((eval when
	   (fboundp 'c-toggle-comment-style)
	   (c-toggle-comment-style 1))
     (eval c-set-offset 'innamespace 0)))
 '(whitespace-style
   '(face trailing newline empty space-after-tab::tab space-after-tab::space space-after-tab space-before-tab::tab space-before-tab::space space-before-tab tab-mark newline-mark)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
