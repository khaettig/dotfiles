alias vi="nvim"
alias vim="nvim"
alias python="python3"
alias xargs="xargs " # See https://unix.stackexchange.com/a/244516
alias xo="xdg-open"

alias ls="ls --color=auto"
alias ll="ls -l"

alias dcbu="docker-compose build && docker-compose up -d"
alias dcbua="docker-compose build && docker-compose up"
alias ds="docker ps -a"

alias n="bash ~/.scripts/open_notes.sh"
alias i="nvim ~/Notes/Incoming.md"
alias w="bash ~/.scripts/open_work_notes.sh"
alias b="bash ~/.scripts/open_brain.sh"
alias v="bash ~/.scripts/open_nvim_config.sh"

alias gitclean="sh ~/.scripts/git_clean.sh"
alias swap_wipe="rm ~/.local/state/nvim/swap/*"

alias sme="cd ~/Git/spotl.media"
alias sma="cd ~/Git/spotl.machine"
alias smc="cd ~/Git/spotl.config"
alias nuke="sh ~/.scripts/nuke.sh"

alias kube_test="gcloud config set project spotl-media-test && gcloud container clusters get-credentials spotl-test-gke"
alias kube_prod="gcloud config set project spotl-media-prod && gcloud container clusters get-credentials spotl-prod-gke"
alias kubec="sh ~/.scripts/kubec.sh"
alias kubenuke="kubectl delete pod --grace-period=0 --force"

if [[ -a .localrc ]]; then
    source .localrc
fi

source <(kubectl completion zsh)

autoload -U colors && colors

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

PROMPT="%F{blue}%1~%f $ "
RPROMPT="%F{241}%T%f"

# Use vi keys
bindkey -v

# Edit line in vi
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
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
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
