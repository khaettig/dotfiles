alias vim="nvim"
alias python="python3"

alias dcbu="docker-compose build && docker-compose up -d"
alias dcbua="docker-compose build && docker-compose up"
alias ds="docker ps -a"

alias tv="tmux -c 'source ~/.bashrc; nvim'"
alias n="bash ~/.scripts/open_notes.sh"
alias w="bash ~/.scripts/open_work_notes.sh"

alias sme="cd ~/Git/spotl.media"
alias sma="cd ~/Git/spotl.machine"

alias deploy="python3 ~/.scripts/deploy/main.py > /tmp/deploy.tmp && grip -b /tmp/deploy.tmp"
alias nuke="sh ~/.scripts/nuke.sh"

alias j="jest --watchAll"
alias jc="j --coverage --coverageReporters="

alias pc="pytest -n auto --cov=. --cov-report="
