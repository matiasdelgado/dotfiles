source ~/work/dotfiles/.aliases
source ~/work/dotfiles/functions/v
source ~/work/dotfiles/functions/n
source ~/work/dotfiles/functions/gch
source ~/work/dotfiles/functions/vimcommit
# fpath+=~/Projects/dotfiles/functions

[ -f ~/.fzf.zsh  ] && source ~/.fzf.zsh
. /usr/local/opt/asdf/asdf.sh
#. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

export LANG=en_US.UTF-8

setopt noincappendhistory
setopt nosharehistory

export LESS=-iXFR
export TERM=xterm-256color-italic

fpath+=$HOME/.zsh/purer
autoload -U promptinit; promptinit
prompt pure

autoload -Uz compinit && compinit

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export CLICOLOR=1

export KERL_CONFIGURE_OPTIONS="--disable-debug --disable-silent-rules --without-javac --enable-shared-zlib --enable-dynamic-ssl-lib --enable-hipe --enable-sctp --enable-smp-support --enable-threads --enable-kernel-poll --enable-wx --enable-darwin-64bit --with-ssl=/usr/local/Cellar/openssl@1.1/1.1.1d"

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

bindkey \^U backward-kill-line
