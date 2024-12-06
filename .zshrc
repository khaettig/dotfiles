alias vi="nvim"
alias vim="nvim"
alias python="python3"
alias xargs="xargs " # See https://unix.stackexchange.com/a/244516
alias xo="xdg-open"
alias rm="trash"

alias ls="ls --color=auto"
alias ll="ls -l"

alias dcbu="docker-compose build && docker-compose up -d"
alias dcbua="docker-compose build && docker-compose up"
alias ds="docker ps -a"

alias i="cd ~/Notes; nvim Incoming.md"
alias n="cd ~/Notes; nvim -c 'OpenNotes'"
alias mr="cd ~/Notes; nvim -c 'OpenMorningReview'"
alias dr="cd ~/Notes; nvim -c 'OpenDailyReview'"
alias w="cd ~/Notes; nvim -c 'OpenWorkNotes'"
alias wm="cd ~/Notes; nvim -c 'OpenWorkMeeting'"
alias b="cd ~/Notes/Brain; nvim -c 'OpenBrain'"
alias v="cd ~/.config/nvim; nvim -c 'OpenVimConfig'"

alias gitclean="sh ~/.scripts/git_clean.sh"
alias trash_swap="trash ~/.local/state/nvim/swap/*"

alias sme="cd ~/Git/spotl.media"
alias sma="cd ~/Git/spotl.machine"
alias smc="cd ~/Git/spotl.config"

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/google-cloud-sdk/completion.zsh.inc'; fi
