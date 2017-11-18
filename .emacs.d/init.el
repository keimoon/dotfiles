(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(mapc 'load (directory-files "~/.emacs.d/keimoon" t ".*\.el"))

(require 'setup-apps)
(require 'setup-editing)
(require 'setup-miscs)
(require 'setup-helm)
(require 'setup-dev)
(require 'setup-c)
(require 'setup-theme)
