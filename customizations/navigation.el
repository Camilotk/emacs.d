;;PT-BR
;; Essas customizações fazem com que seja mais facil navegar arquivos,
;; trocar de buffers, e escolher as opções no minibuffer.
;;EN
;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer

;; pt-br: Muda o buffer inicial
;; en: Changes the default startup buffer
(setq inhibit-startup-message t)
(let ((filename "~/.emacs.d/startup.el"))
  (when (and (file-exists-p filename)
             (get-buffer "*scratch*"))
    (with-current-buffer "*scratch*"
      (erase-buffer)
      (insert-file-contents filename))))

;;PT-BR
;; "Quando diversos buffers usam arquivos com nomes idênticos
;;  Emacs deve dar nomes distintos a cada buffer. A forma usual
;;  é adicionar <2>, <3> no final do nome do buffer.
;;  Essa forma ao invés disso adiciona o caminho das pastas anteriores
;;  no começo do nome do arquivo.
;;EN
;; "When several buffers visit identically-named files,
;; Emacs must give the buffers distinct names. The usual method
;; for making buffer names unique adds ‘<2>’, ‘<3>’, etc. to the end
;; of the buffer names (all but one of them).
;; The forward naming method includes part of the file's directory
;; name at the beginning of the buffer name
;;DOC
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;;PT-BR
;; Ativa o modo de arquivos recentes o que permite trocar mais facilmente
;; pelos arquivos editados quando o emacs é inicializado.
;;EN
;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)


;;PT-BR
;; ido-mode permite que a navegação entre as opções seja mais fácil.
;; EX: quando tem que trocar os buffers, ele apresenta uma lista,
;; de buffers no minibuffer. Quando começasse a digitar ele apresenta
;; um autocomplete dos possíveis nomes de buffers que combinam com
;; o nome que está sendo digitado.
;;EN:
;; ido-mode allows you to more easily navigate choices. For example,
;; when you want to switch buffers, ido presents you with a list
;; of buffers in the the mini-buffer. As you start to type a buffer's
;; name, ido will narrow down the list of buffers to match the text
;; you've typed in
;;DOC
;; http://www.emacswiki.org/emacs/InteractivelyDoThings
(ido-mode t)

;; pt-br: Permite combinações parciais. ex. "ca" combina com "Camilo Azevedo"
;; en: This allows partial matches, e.g. "tl" will match "Tyrion Lannister"
(setq ido-enable-flex-matching t)

;; pt-br: Torna essa função desligada, porque acaba sendo incomôda
;; en: Turn this behavior off because it's annoying
(setq ido-use-filename-at-point nil)

;;PT-BR
;; Não tenta encontrar arquivos em todas as pastas; apenas tenta encontrar
;; arquivos no diretório atual no minibuffer
;;EN
;; Don't try to match file across all "work" directories; only match files
;; in the current directory displayed in the minibuffer
(setq ido-auto-merge-work-directories-length -1)

;;PT-BR
;; Inclui o nome de buffer nos arquivos recentes, mesmo se eles não
;; forem abertos.
;;EN
;; Includes buffer names of recently open files, even if they're not
;; open now
(setq ido-use-virtual-buffers t)

;;PT-BR
;; Isso permite que o ido seja usado em todos os contextos que ele pode
;; ser util para selecionar buffers ou nomes de arquivo.
;;EN
;; This enables ido in all contexts where it could be useful, not just
;; for selecting buffer and file names
(ido-ubiquitous-mode t)
(ido-everywhere t)

;; pt-br: Mostra uma lista de buffers.
;; en: Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;PT-BR
;; Melhora M-x para permitir a execução de forma mais fácil.
;; Provê uma lista de possiveis comandos no minibuffer.
;;EN
;; Enhances M-x to allow easier execution of commands. Provides
;; a filterable list of possible commands in the minibuffer
;;DOC
;; http://www.emacswiki.org/emacs/Smex
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; pt-br: projectile em todo lugar!
;; en: projectile everywhere!
(projectile-global-mode)

;; pt-br: Não cria ~ arquivos durante a edição. 
;; en: No need for ~ files when editing
(setq create-lockfiles nil)

;; pt-br: Muda as perguntas de yes/no para y/n
;; en: Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)
