(setq backup-inhibited t)
(setq column-number-mode t)

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

(defun scroll-up-10-lines ()
  "Scroll up 10 lines"
  (interactive)
  (scroll-up 10))

(defun scroll-down-10-lines ()
  "Scroll down 10 lines"
  (interactive)
  (scroll-down 10))

(global-set-key (kbd "<mouse-4>") 'scroll-down-10-lines)
(global-set-key (kbd "<mouse-5>") 'scroll-up-10-lines)


(defun xah-forward-block (&optional n)
    "Move cursor beginning of next text block.
A text block is separated by blank lines.
This command similar to `forward-paragraph', but this command's behavior is the same regardless of syntax table.
URL `http://ergoemacs.org/emacs/emacs_move_by_paragraph.html'
Version 2016-06-15"
    (interactive "p")
    (let ((n (if (null n) 1 n)))
          (re-search-forward "\n[\t\n ]*\n+" nil "NOERROR" n)))

(defun xah-backward-block (&optional n)
    "Move cursor to previous text block.
See: `xah-forward-block'
URL `http://ergoemacs.org/emacs/emacs_move_by_paragraph.html'
Version 2016-06-15"
    (interactive "p")
    (let ((n (if (null n) 1 n))
	  (-i 1))
      (while (<= -i n)
	(if (search-backward-regexp "\n[\t\n ]*\n+" nil "NOERROR")
	    (progn (skip-chars-backward "\n\t "))
	  (progn (goto-char (point-min))
		 (setq -i n)))
	      (setq -i (1+ -i)))))

(global-set-key (kbd "<mouse-8>") 'xah-backward-block)
(global-set-key (kbd "<mouse-9>") 'xah-forward-block)
