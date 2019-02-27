;; EVIL
(use-package evil
	     :ensure t
	     :config
	     (require 'evil)
	     (evil-mode 1))


;; EVIL surround
(use-package evil-surround
	     :ensure t
             :config
             (global-evil-surround-mode 1))

;; EVIL escape
(use-package evil-escape
             :ensure t
             :config
             (evil-escape-mode))
