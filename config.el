;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Prem Modha"
      user-mail-address "premmodhaOfficial@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
; (setq doom-font (font-spec :family "JetBrainsMonoNl" :size 12 :weight 'semi-light))
;;doom-font (font-spec :family "FiraCode NerdFont" :size 12 :weight 'medium))
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'spacemacs-dark)
(setq doom-theme 'spacemacs-dark)
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 22 :weight 'light :slant 'normal :width 'normal :scalable 'true))
       ;; full name: JetBrainsMonoNL Nerd Font Mono:pixelsize=22:foundry=JB:weight=bold:slant=italic:width=normal:spacing=100:scalable=true
       ;; ====

;; full name: JetBrainsMono Nerd Font:pixelsize=22:foundry=JB:weight=extra-bold:slant=italic:width=normal:spacing=100:scalable=true
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-roam-directory "~/org/roam/")
(setq org-agenda-files '("~/org/roam/" "~/org/"))


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! websocket
    :after org-roam)
(setq org-roam-completion-everywhere t)
(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; (setq vterm-shell `/bin/bash)

;; tranceparency
;; (set-frame-parameter nil 'alpha '(96 96))
(add-to-list 'default-frame-alist '(alpha-background . 80));;
(setq scroll-margin 5)

;; ;; orgmode
;; (add-to-list 'org-hide-emphasis-markers 't)

;; lsp for the cc
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))


;; for ccls
;; (after! ccls
;;   (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
;;   (set-lsp-priority! 'ccls 2)) ; optional as ccls is the default in Doom
;; (use-package! obsidian
;;   :ensure t
;;   :demand t
;;   :config
;;   (obsidian-specify-path "~/A_Prem")
;;   (global-obsidian-mode t)
;;   :custom
;;   ;; This directory will be used for `obsidian-capture' if set.
;;   (obsidian-inbox-directory "Inbox")
;;   :bind (:map obsidian-mode-map
;;   ("C-c C-a" . obsidian-capture)
;;   ;; Replace C-c C-o with Obsidian.el's implementation. It's ok to use another key binding.
;;   ("C-c C-o" . obsidian-follow-link-at-point)
;;   ;; Jump to backlinks
;;   ("C-c C-b" . obsidian-backlink-jump)
;;   ;; If you prefer you can use `obsidian-insert-link'
;;   ("C-c C-l" . obsidian-insert-wikilink)))
