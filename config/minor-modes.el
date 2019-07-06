(use-package smart-tabs-mode
  :ensure t
  :config (smart-tabs-insinuate 'c 'javascript))

(use-package paredit
  :ensure t)

;; PHP debug interface
(use-package geben
  :ensure t
  :config (setq geben-path-mappings '(("/Users/marcos/repos/blink" "/var/www/mas/")))
  (add-hook 'geben-mode-hook 'evil-emacs-state))
