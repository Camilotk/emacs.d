# Emacs

Criei este repositório apenas para manter o controle de versão dos meus arquivos
de configuração do Emacs, que na verdade são muito básicos - sigo a filosofia que
quanto menos configurações desnecessárias, menos problemas. Utilizo Emacs para
programar em Python, PHP, JS, C, LISP (elisp, racket, scheme e clojure) com essas
configurações sem problemas, apesar de ser como disse anteriormente minimas, caso 
queira testar e quiser incrementá-lo com mais configurações e extensões, recomento
seguir este [esse tutorial de introdução (em inglês)](http://www.braveclojure.com/basic-emacs/)!
Me isento de qualquer problema causado pelo uso dessas configurações.

## Instalando

1. Feche o Emacs.
2. Delete a pasta `~/.emacs` ou `~/.emacs.d` caso ela exista. `rm -Rf ~/emacs || rm -Rf ~/.emacs.d`
3. Clone essa configuração na sua /home `cd ~ && git clone https://github.com/Camilotk/emacs.d.git`

Abra o Emacs.

## Atualizando

Antes de atualizar verifique se a sua pasta `.emacs.d` está com 
controle de versão, caso algo dê errado é só dar um reset.

Para atualizar:

1. Edite `.emacs.d/init.el`, fazendo essas modificações após a linha 12:

   ```elisp
   (add-to-list 'package-archives
                '("melpa-stable" . "http://stable.melpa.org/packages/") t)
   
   (add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
   ```

2. Feche o Emacs.
3. Rode o comando `rm -Rf .emacs.d/elpa/cider-*`
4. Abra o Emacs. Vai ter alguns erros sendo exibidos... Tudo bem.
5. No Emacs, rode no minibuffer `M-x package-refresh contents`.
6. No Emacs, rode no minibuffer `M-x package-install cider`.
7. Feche e abra o Emacs novamente.

Pronto!
