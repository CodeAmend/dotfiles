# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

EDITOR=nvim
VISUAL=nvim

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

autoload -U edit-command-line
# Emacs style
# zle -N edit-command-line
# bindkey '^xe' edit-command-line
# bindkey '^x^e' edit-command-line
# Vi style:
zle -N edit-command-line
bindkey -M vicmd v edit-command-line:w

source ~/.antigen.zsh

# Plugins from default repo
antigen bundle git
antigen bundle vi-mode

# Other Plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle hlissner/zsh-autopair

# THEME
antigen theme bureau

antigen apply

ZSH_THEME="bureau"



DISABLE_AUTO_UPDATE="true"
# DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
#
source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"
# export ARCHFLAGS="-arch x86_64"


# Example aliases
alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='xzdiff --color=auto'
alias sudo='sudo -E'

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"


# colored man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

MARKMAPS="$HOME/code/clients/duffy.mark/carousel-maps"
MAPSERVER="$HOME/code/clients/duffy.mark/headless-do-map-renderer/headless-map-renderer"
MICHALAUTHOR="$HOME/code/clients/michael.author/"
OPENLOVEQUIZ="$HOME/code/clients/michael.author/super-secret-open-love-quiz"
ALGORITHMS="$HOME/code/learning/udemy/algorithms-javascript-colt"
CPP="$HOME/code/learning/c++"

# Syntax Highlighting
# source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /home/mibru/.antigen/bundles/hlissner/zsh-autopair/autopair.plugin.zsh

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

eval $(thefuck --alias)
