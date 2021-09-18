source ~/work/dotfiles/.aliases
source ~/work/dotfiles/functions/v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. /usr/local/opt/asdf/asdf.sh

export LESS=-iXFR
export TERM=xterm-256color-italic

autoload -U promptinit; promptinit
prompt purer

autoload -Uz compinit && compinit

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export CLICOLOR=1
