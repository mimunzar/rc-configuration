(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; enable IDO mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(ido-mode 1)

;; shorter prompt
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
	    kill-buffer-query-functions))

;; tooltips in echo area
(tooltip-mode -1)
(setq tolltip-use-echo-area t)

;; add new line when reached end-of-buffer
(setq next-line-add-newlines t)
(put 'set-goal-column 'disabled nil)
