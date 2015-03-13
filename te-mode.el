(define-prefix-command 'te-mode-keymap)

(define-key te-mode-keymap (kbd "v") 'te-file)
(define-key te-mode-keymap (kbd "l") 'te-line)
(define-key te-mode-keymap (kbd "a") 'te-all)
(define-key te-mode-keymap (kbd ",") 'te-last)


(defcustom te-key-command-prefix  (kbd "C-c ,")
  "The prefix for all rspec related key commands"
  :type 'string
  :group 'te-mode)

(define-minor-mode te-mode
  :lighter " Te"
  :keymap `((,te-key-command-prefix . te-mode-keymap)))

(defun te-file ()
  "Runs the specified test file"
  (interactive)
  (te-run (buffer-file-name)))

(defun te-line ()
  (interactive)
  (te-run (current-file-with-line)))

(defun te-all ()
  (interactive)
  (te-run ""))

(defun te-last ()
  (interactive)
  (shell-command "te run-last"))

(defun te-run (args)
  (interactive)
  (shell-command (concat "te run " args)))

(defun current-file-with-line ()
  (interactive)
  (concat (buffer-file-name) ":" (number-to-string (line-number-at-pos))))
