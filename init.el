(defvar ue-dir (file-name-directory load-file-name))
(defvar ue-etc-dir (expand-file-name "etc" ue-dir))
(defvar ue-var-dir (expand-file-name "var" ue-dir))
(defvar ue-profiles-dir (expand-file-name "profiles" ue-dir))

(add-to-list 'load-path ue-etc-dir)
(add-to-list 'load-path ue-profiles-dir)

(setq custom-file (expand-file-name "custom.el" ue-var-dir))
(if (file-exists-p custom-file)
    (load custom-file))

(require 'package)

(setq package-selected-packages nil)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(setq package-user-dir (expand-file-name "packages" ue-var-dir))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun ue-ensure-installed (packages)
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))


(if (eq system-type 'darwin)
    (progn
      (ue-ensure-installed '(exec-path-from-shell))
      (exec-path-from-shell-initialize)))


(defvar ue-profile (car (split-string (system-name) "\\\.")))

(require (intern (concat "ue-profile-machine-" ue-profile)) nil t)
