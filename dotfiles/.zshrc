if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/.histfile

if [[ -v $LAPTOP ]]; then
    export ZSH="/usr/share/oh-my-zsh"
    ZSH_CUSTOM="/usr/share"
    ZSH_THEME="zsh-theme-powerlevel10k/powerlevel10k"
else
    export ZSH="$HOME/.oh-my-zsh"
    ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# ZSH_CUSTOM=/path/to/new-custom-folder

#plugins=(git vi-mode zsh-autosuggestions)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

bindkey -v

function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}

zle -N zle-keymap-select

zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"

    echoti smkx # Del key: https://git.suckless.org/st/file/FAQ.html
}

zle -N zle-line-init

echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

export VISUAL="nvim"
autoload edit-command-line; zle -N edit-command-line
bindkey '^E' edit-command-line

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

function zle-line-finish () { echoti rmkx }
zle -N zle-line-finish

source ~/.zshrc_aliases

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
bindkey -s '^o' 'xdg-open "$(fzf)"\n'
