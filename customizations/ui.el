;; pt-br: Carrega o tema, comente/descomente de acordo com preferencia.
;; en: Loads the EMACS theme, comment/uncomment by preference.
;; (load-theme 'solarized-light t)
(load-theme 'solarized-dark t)

;; pt-br: Insere o número das linhas. 
;; en: Insert line numbers.
(global-linum-mode)

;; pt-br: Desativa o cursor piscando.
;; en: No cursor blinking, it's distracting.
(blink-cursor-mode 0)

;; pt-br: caminho completo na barra de título.
;; en: full path in title bar
(setq-default frame-title-format "%b (%f)")

;; pt-br: sem sons irritantes.
;; en: no bell
(setq ring-bell-function 'ignore)

;; pt-br: melhora a legibilidade das fontes.
;; en: increase font size for better readability
(set-face-attribute 'default nil :height 140)

;; pt-br: Essas configurações são sobre como o emacs interage com o OS.
;; en: These settings relate to how emacs interacts with your operating system
(setq ;; en: makes killing/yanking interact with the clipboard
      ;; pt-br: faz com que se possa copiar/colar do sistema.
      x-select-enable-clipboard t
      ;; pt-br: Não sei o que faz, mas Deus quis assim.
      ;; en: I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t
      ;; pt-br: Colar com o comando do mouse.
      ;; en: Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)


