(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; set a couple of default key options
;; mostly around using the Command keys as meta to allow the option keys
;; as option in order to allow non-ascii characters to be typed
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq-default indent-tabs-mode nil)

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives (append package-archives
		        '(("melpa" . "https://melpa.org/packages/")
		        ("marmalade" . "https://marmalade-repo.org/packages/")
		        ("gnu" . "http://elpa.gnu.org/packages/")
		        ("elpy" . "http://jorgenschaefer.github.io/packages/"))))
(package-initialize)
(package-refresh-contents)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
        (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))


;; SLIME
(use-package slime
             :ensure t
             :init
             (setq inferior-lisp-program "/usr/local/bin/sbcl")
             (setq slime-contribs '(slime-fancy)))

(load-file "~/.emacs.d/config/helm-config.el")
(load-file "~/.emacs.d/config/major-modes.el")
;;(load-file "~/.emacs.d/config/evil.el")
(load-file "~/.emacs.d/config/minor-modes.el")
(load-file "~/.emacs.d/config/utilities.el")
(load-file "~/.emacs.d/config/keymap.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (json-mode paredit smart-tabs-mode parinfer magit helm-ag php-mode evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
