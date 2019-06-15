;;;
;; pt-br: Pacotes / en: Packages
;;;

;; pt-br: Define os repositórios dos pacotes
;; en:    Define packages repositories
(require 'package)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)

;; pt-br: Carrega e ativa os pacotes do emacs. Isso é importante para que
;;        os pacotes sejam carregados antes de que possam ser modificados
;;        Isso também carrega o caminho (path).
;; en: Load and activate emacs packages. Do this first so that the
;;     packages are loaded before you start trying to modify them.
;;     This also sets the load path.
(package-initialize)

;; pt-br: Atualiza os pacotes no repositório ELPA.
;; en: This informs Emacs about the latest versions of packages in ELPA
(when (not package-archive-contents)
  (package-refresh-contents))

;; pt-br: Lista com todos os pacotes que serão instalados. Eles também
;;        podem ser instalados com M-x package-install
;; en: The packages you want installed. You can also install these
;;     manually with M-x package-install
(defvar camilotk/packages
  '(;;;
    ;; GENERAL PACKAGES / PACOTES GERAIS
    ;;;

    ;; pt-br: faz com que seja muito mais fácil trabalhar com LISP
    ;; en: makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit
    
    ;; pt-br: permite o ido ser usado em todos os contextos possiveis
    ;; en: allow ido usage in as many contexts as possible.
    ido-completing-read+
    
    ;; pt-br: Melhora o M-x para facilitar a exec. dos comandos. Cria
    ;;        uma lista com possiveis preenchimentos dos comandos no minibuffer
    ;; en: Enhances M-x to allow easier execution of commands. Provides
    ;;     a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex
    
    ;; pt-br: navegação de projeto
    ;; en: project navigation
    projectile
    
    ;; pt-br: match colorido de parentesis
    ;; en: colorful parenthesis matching
    rainbow-delimiters
    
    ;; pt-br: edita as tags html como s-expressions
    ;; en: edit html tags like sexps
    tagedit
    
    ;; pt-br: integração com o git
    ;; en: git integration
    magit

    ;;; 
    ;; PROGRAMING LANGUAGES PACKAGES / PACOTES DE PROGRAMAÇÃO
    ;;;

    ;; python
    elpy
    
    ;; php
    php-mode
    
    ;; scheme
    geiser ;; https://www.nongnu.org/geiser/geiser_5.html#Cheat-sheet
    racket-mode ;; https://www.racket-mode.com/

    ;;;
    ;; UNNECESSARY BUT COOL STUFF / COISAS BACANAS
    ;;;
    solarized-theme ;; better colors pallete / theme
    pacmacs ;; packman
    helm-spotify-plus))

;; pt-br: Instala os pacotes que não estão instalados.
;; en: Installs the uninstalled packages.
(dolist (p camilotk/packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;; Necessário para que o emacs carregue todos os pacoters corretamente
;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;;
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")

;;;
;; CUSTOMIZATIONS / CUSTOMIZAÇÕES
;;;

;; pt-br: Adiciona o caminho na lista de coisas carregaveis
;; en: Add a directory to our load path that when you `load` things
(add-to-list 'load-path "~/.emacs.d/customizations")

(load "ui.el")
(load "navigation.el")
