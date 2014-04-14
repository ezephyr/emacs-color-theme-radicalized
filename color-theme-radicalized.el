;;; Author: Ethan Schoonover, Solarized; Greg Pfeil, Emacs adaptation
;;; URL: http://ethanschoonover.com/solarized

;;; This file is not (YET) part of GNU Emacs.

;;; # Usage

;;; 1. Install the color-theme package
;;;   (http://www.emacswiki.org/cgi-bin/wiki/ColorTheme)
;;; 2. Load this file
;;; 3. M-x color-theme-radicalized-[dark|light]

(let ((current-file-name (or load-file-name buffer-file-name)))
  (if current-file-name
    (let* ((reqname (concat (file-name-directory current-file-name)
                            "radicalized-definitions.el"))
           (compreqname (concat reqname "c")))
      (require 'radicalized-definitions
               (if (file-exists-p compreqname) compreqname reqname)))
    (require 'radicalized-definitions)))

(eval-when-compile
  (require 'color-theme))

;;;###autoload
(defun color-theme-radicalized (mode)
  "Color theme by Ethan Schoonover, created 2011-03-24.
Ported to Emacs by Greg Pfeil, http://ethanschoonover.com/solarized."
  (interactive "Slight or dark? ")
  (color-theme-install
   (let* ((definitions (radicalized-color-definitions mode))
          (faces (first definitions))
          (variables (second definitions)))
       (radicalized-color-definitions mode)
     `(,(intern (concat "color-theme-radicalized-" (symbol-name mode)))
       ,variables
       ,@faces))))

;;;###autoload
(defun color-theme-radicalized-dark ()
  (interactive)
  (color-theme-radicalized 'dark))

;;;###autoload
(defun color-theme-radicalized-light ()
  (interactive)
  (color-theme-radicalized 'light))

(add-to-list 'color-themes
             `(color-theme-radicalized-light
               "Radicalized Light"
               ,radicalized-description))
(add-to-list 'color-themes
             `(color-theme-radicalized-dark
               "Radicalized Dark"
               ,radicalized-description))

(provide 'color-theme-radicalized)
