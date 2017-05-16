(setq backup-inhibited t)

(global-set-key (kbd "M-.") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g M-l") 'avy-goto-line)
(global-set-key (kbd "M-g M-f") 'avy-goto-word-1)
(global-set-key (kbd "M-g M-h") 'avy-goto-word-0)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(require 'multiple-cursors)

;;(global-set-key(kbd "M-s-c M-s-c") 'mc/edit-lines)
(global-unset-key(kbd "C-d"))
(global-unset-key(kbd "C-f"))
(global-unset-key(kbd "C-v"))
(global-set-key(kbd "C-d") 'mc/mark-next-like-this)
(global-set-key(kbd "C-f") 'mc/mark-previous-like-this)
(global-set-key(kbd "C-v") 'mc/mark-all-like-this)
;;(global-set-key (kbd "M-[ m") 'mc/add-cursor-on-click)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(xterm-mouse-mode 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
