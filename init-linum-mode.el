(when *emacs23*
  (global-linum-mode t)

  ;@see http://www.emacswiki.org/emacs-en/GnusEncryptedAuthInfo
  (require 'epa-file) (epa-file-enable)

  ;http://stackoverflow.com/questions/3875213/ \
  ;turning-on-linum-mode-when-in-python-c-mode
  (setq linum-mode-inhibit-modes-list '(eshell-mode
                                         shell-mode
                                         erc-mode
                                         jabber-roster-mode
                                         jabber-chat-mode
                                         gnus-group-mode
                                         w3m-mode
                                         gnus-summary-mode
                                         gnus-article-mode))
  (defadvice linum-on (around linum-on-inhibit-for-modes)
             "Stop the load of linum-mode for some major modes."
             (unless (member major-mode linum-mode-inhibit-modes-list)
               ad-do-it))
  (ad-activate 'linum-on)
  )
(provide 'init-linum-mode)