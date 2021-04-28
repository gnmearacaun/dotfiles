### Simple ZSH @ https://github.com/gnmearacaun
### Prompt is: Go Bullet Train (GBT) https://github.com/jtyr/gbt
### Inspiration: https://github.com/ChristianChiarulli/Machfiles

HISTFILE=$HOME/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
HIST_STAMPS="yy-mm-dd"

# Options
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt vi histignorealldups sharehistory
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt rmstarsilent
setopt interactivecomments
# Type name of directory to go there
setopt AUTO_CD
# Options `man zshoptions`
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

############ Eported Paths and Variables ##########
export PATH=$PATH:$HOME/.local/git
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export PATH=$PATH:$HOME/scripts/anaconda3/bin
export TERM=xterm-256color
export EDITOR=nvim
export VISUAL=nvim
export VIMCONFIG=$HOME/.config/nvim
export MYVIMRC=$HOME/.config/nvim/init.lua
export VIMDATA=$HOME/.local/share/nvim
export BROWSER='/usr/bin/w3m'
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Zsh-autosuggestions is designed to be relatively unobtrusive
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=246'

# source all files in function directory
if [ -d "$HOME/.config/function" ]; then
  for f in "$HOME"/.config/function/*
    do source "$f"
  done
fi

# ALIASES
source $HOME/.alias
#startup fortune | cowsay here 
source $HOME/.zlogin

#if [ -d "$HOME/scripts/sdk-android-tools" ] ; then
#     export PATH="$HOME/scripts/sdk-android-tools:$PATH"
#fi

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#============fzf==============
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
#suggested options from the author of fzf here:https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings#changing-the-layout
export FZF_COMPLETION_TRIGGER=''
export FZF_BASE="$HOME/.fzf"
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
export FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --follow --glob "!.git/*"'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
#export FZF_CTRL_R_OPTS='--sort'
#export FZF_CTRL_R_OPTS='--sort --exact'
#
#Zsh Line Editor (ZLE)
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}

autoload history-incremental-search-forward; zle -N history-incremental-search-forward
autoload history-incremental-search-backward; zle -N history-incremental-search-backward
autoload up-line-or-beginning-search; zle -N up-line-or-beginning-search
autoload down-line-or-beginning-search; zle -N down-line-or-beginning-search
autoload edit-command-line; zle -N edit-command-line
autoload fzf-history-widget-accept; zle -N fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

##########
## vi mode
##########
bindkey -v
# Edit the command in the editor
bindkey -M vicmd "^e" edit-command-line
# KEYTIMEOUT is in hundredths of a second
#export KEYTIMEOUT=1

# Switch to vi command mode without [ESC] !
bindkey 'kj' vi-cmd-mode
bindkey 'jj' vi-cmd-mode
bindkey '^o' vi-cmd-mode

# Commandline KEYMAP
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search
bindkey -r "^u"
bindkey -r "^d"
# # incremental search in vi command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
# incremental search in insert mode
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward
bindkey -v '^?' backward-delete-char
bindkey '^[[P' delete-char
#DISABLE_CORRECTION="true"

# Initialize Prompt
autoload -U promptinit
promptinit
setopt PROMPT_SUBST

## Completion ###
autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' rehash true
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose truezstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# Colors
autoload -Uz colors && colors


# >>> conda init >>> 
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '$HOME/scripts/python/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "$HOME/scripts/python/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/scripts/python/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="$HOME/scripts/python/anaconda3/bin:$PATH"
    fi
fi

unset __conda_setup
# <<< conda init <<<

# History substring search
if [ -f $HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
    source $HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

# Midnight Commander chdir enhancement
if [ -f /usr/lib/mc/mc.sh ]; then
    source /usr/lib/mc/mc.sh
fi

#======= GBT prompt forwarding ==============

export GBT__HOME='/usr/share/gbt'
# Themes # Leave commented for the default prompt
#source $GBT__HOME/themes/in-fino-veritas.sh
#source $GBT__HOME/themes/mrdrup.sh
#source $GBT__HOME/themes/square_brackets_multiline.sh

if [ -f $GBT__HOME/sources/gbts/cmd/local.sh ]; then
    source $GBT__HOME/sources/gbts/cmd/local.sh
fi

# Basic prompt for non-graphical terminals
#if [[ "$TERM" != xterm* ]] && [ -f $GBT__HOME/themes/basic.sh ]; then
#    source $GBT__HOME/themes/basic.sh
#fi

# GBT prompt
PROMPT='$(gbt $?)'

#These plugins should be sourced at the end of the file and in this order, as per https://github.com/softmoth/zsh-vim-mode and https://github.com/zsh-users/zsh-syntax-highlighting
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[comment]='fg=white,bold'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$HOME/.config/nvim/utils/bin:$PATH 
