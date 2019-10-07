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

;; Just some stuff
(setq auto-save-default nil)
(global-auto-revert-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everwhere t)
(ido-mode 1)

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

;; (load-file "~/.emacs.d/config/helm-config.el")
(load-file "~/.emacs.d/config/major-modes.el")
(load-file "~/.emacs.d/config/evil.el")
(load-file "~/.emacs.d/config/minor-modes.el")
(load-file "~/.emacs.d/config/utilities.el")
(load-file "~/.emacs.d/generators/cartesian-product.el")
(load-file "~/.emacs.d/vendor/ace-jump-mode.el")
(load-file "~/.emacs.d/config/keymap.el")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

;; get rid of the pesky configs that emacs adds automatically.
;; why?
;; because I like installing, trying, and often, uninstalling packages.
;; One side effect of allowing emacs to place the custom-set-variables
;; and others here is that after removing or commenting out a config -
;; this config loads those packages - the package will be loaded again
;; due to Emacs setting the package-selected-packages to all packages
;; which it has loaded at any point.
;; We can get away from this by either editing the custom values, or
;; by moving these generated values to a location that will not be loaded
;; by this file.
(setq custom-file (concat user-emacs-directory "/custom.el"))
(put 'narrow-to-region 'disabled nil)
