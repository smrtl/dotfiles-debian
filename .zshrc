## Zinit
source ~/.zinit/bin/zinit.zsh

PS1="> "

# OMZ lib, no wait !
zinit for \
  OMZL::completion.zsh \
  OMZL::git.zsh \
  OMZL::history.zsh \
  OMZL::key-bindings.zsh \
  OMZL::prompt_info_functions.zsh \
  OMZL::theme-and-appearance.zsh

# Plugins
zinit wait lucid for \
  OMZP::git \
  OMZP::colored-man-pages \
  atinit"export NVM_LAZY_LOAD=true" lukechilds/zsh-nvm \
  davidparsson/zsh-pyenv-lazy

# Compinit & co, theme
zinit wait'!' lucid for \
  atinit"zicompinit; zicdreplay; setopt promptsubst" \
    OMZT::robbyrussell

## ZSH options
unsetopt autocd beep

## Functions
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time -f 'real %e; user %U; sys %S' $shell -i -c exit; done
}

## Aliases
alias l='ls -Al'
alias ll='ls -l'
alias la='ls -lA'

alias gi='grep -i'
alias reboot='sudo reboot'
alias halt='sudo shutdown -h now'

## Auto startx
if [[ -z "$DISPLAY" ]] && [[ "$(tty)" = "/dev/tty1" ]]; then startx; fi
