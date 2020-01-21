;; PHP
(use-package php-mode
             :ensure t)


;; Magit -- woot! --
(use-package magit
  :ensure t)

;; SLIME
(use-package slime
             :ensure t
             :init
             (setq inferior-lisp-program "/usr/local/bin/sbcl")
             (setq slime-contribs '(slime-fancy)))

;; Haskell Mode
(use-package haskell-mode
             :ensure t)

;; JSON mode
(use-package json-mode
  :ensure t)

;; YAML mode
(use-package yaml-mode
  :ensure t)
