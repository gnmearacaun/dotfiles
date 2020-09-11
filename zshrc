# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /home/briain/scripts/neovim-config/antigen.zsh
# Load Antigen configurations
antigen init ~/.antigenrc

ZSH=$HOME/.oh-my-zsh
source $ZSH
source $ZSH/oh-my-zsh.sh

# OH-MY-ZSH CONFIGURATION
DISABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"
#to type just the name of the directory when changing to it
setopt AUTO_CD
setopt vi histignorealldups sharehistory
#export TERM=xterm-256color
#export TERM=rxvt
export PATH=$PATH:/usr/local/go/bin:~/go/bin
export PATH=$PATH:/home/briain/scripts/anaconda3/bin
export PATH=$PATH:/home/briain/.cargo/bin
export PATH=$PATH:$VIMCONFIG/pack/packager/start/fzf/bin
export PATH=$PATH:$VIMCONFIG/pack/packager/start/fzf.vim/bin
export PATH=$PATH:/snap/bin:/usr/local/bin

export EDITOR=nvim
export VISUAL=nvim
export VIMCONFIG=~/.config/nvim
export MYVIMRC=~/.config/nvim/init.vim
export VIMDATA=~/.local/share/nvim
export BROWSER='/usr/bin/lynx'
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
#export NV_DIR="/home/briain/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#
#to run fman installed with snap
#emulate sh -c 'source /etc/profile'

. ~/scripts/neovim-config/z.sh
#
# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'
[ -f ~/.zsh_secret ] && source ~/.zsh_secret

# ALIAS
source ~/.alias

# HUB not sure if it's useful bod
#eval "$(hub alias -s)"
#fpath=(~/.zsh/completions $fpath)
#autoload -Uz compinit && compinit

#if [ -d "$HOME/scripts/sdk-android-tools" ] ; then
#     export PATH="$HOME/scripts/sdk-android-tools:$PATH"
#fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#suggested options from the author of fzf here:https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings#changing-the-layout
export FZF_COMPLETION_TRIGGER=''
#may not be needed (next line)
export FZF_BASE="$HOME/.fzf"
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
bindkey -v
export FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND='rg --files'
#export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
#export FZF_DEFAULT_COMMAND='fd --files --hidden --smart-case --follow --glob "!.git/*"'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
#export FZF_CTRL_T_OPTS="--select-1 --exit-0"
#export FZF_CTRL_R_OPTS='--sort'
#export FZF_CTRL_R_OPTS='--sort --exact'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
#directly excecute a command
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

zstyle ':completion:*' rehash true
# Use modern completion system
autoload -Uz compinit
#compinitzstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose truezstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/briain/scripts/python/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/briain/scripts/python/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/briain/scripts/python/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/briain/scripts/python/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

source ~/scripts/neovim-config/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/scripts/neovim-config/powerlevel10k/powerlevel10k.zsh-theme
#source /usr/share/fzf/key-bindings.zsh
#source /usr/share/fzf/completion.zsh
