;; Yank text to clipboard
(cond
 ;; OS X
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (setq save-to-clipboard-cmd "pbcopy")
    (setq paste-from-clipboard-cmd "pbpaste")
    )
  )
 ;; Linux
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (setq save-to-clipboard-cmd "xsel -i -b")
    (setq paste-from-clipboard-cmd "xsel -o -b")
    )
  )
 )

(defun copy-to-clipboard ()
  "Copies selection to x-clipboard."
  (interactive)
  (if (display-graphic-p)
      (progn
        (message "Yanked region to x-clipboard!")
        (call-interactively 'clipboard-kill-ring-save)
        )
    (if (region-active-p)
        (progn
          (shell-command-on-region (region-beginning) (region-end) save-to-clipboard-cmd)
          (message "Yanked region to clipboard!")
          (deactivate-mark))
      (message "No region active; can't yank to clipboard!")))
  )

(defun paste-from-clipboard ()
  "Pastes from x-clipboard."
  (interactive)
  (if (display-graphic-p)
      (progn
        (clipboard-yank)
        (message "graphics active")
        )
    (insert (shell-command-to-string paste-from-clipboard-cmd))
    )
  )
(evil-leader/set-key "o y" 'copy-to-clipboard)
(evil-leader/set-key "o p" 'paste-from-clipboard)
