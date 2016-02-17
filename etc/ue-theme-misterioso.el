(setq custom-enabled-themes '(misterioso))
(load-theme 'misterioso)

(custom-set-faces
 '(header-line ((t (:background "steel" :foreground "#333333")))))

(if (boundp 'ue-company-enabled)
    (custom-set-faces
     '(company-tooltip ((t (:background "steel"))))))

(defvar ue-theme-misterioso-enabled t)
(provide 'ue-theme-misterioso)
