alias vim="nvim"
alias python="python3"
alias xargs="xargs " # See https://unix.stackexchange.com/a/244516
alias xo="xdg-open"

alias dcbu="docker-compose build && docker-compose up -d"
alias dcbua="docker-compose build && docker-compose up"
alias ds="docker ps -a"

alias tv="tmux -c 'source ~/.bashrc; nvim'"
alias n="bash ~/.scripts/open_notes.sh"
alias i="nvim ~/Notes/Incoming.md"
alias w="bash ~/.scripts/open_work_notes.sh"


alias sme="cd ~/Git/spotl.media"
alias sma="cd ~/Git/spotl.machine"
alias smc="cd ~/Git/spotl.config"

alias start_release="python3 ~/.scripts/deploy/main.py on_develop testing > /tmp/deploy.tmp && grip -b /tmp/deploy.tmp"
alias merge_bugfixes="python3 ~/.scripts/deploy/main.py on_release testing > /tmp/deploy.tmp && grip -b /tmp/deploy.tmp"
alias merge_hotfixes="python3 ~/.scripts/deploy/main.py approved delivered > /tmp/deploy.tmp && grip -b /tmp/deploy.tmp"
alias nuke="sh ~/.scripts/nuke.sh"

alias jc="jest --coverage --coverageReporters=json"
alias jw="jest --watchAll"
alias jwc="jc --watchAll"

alias ptwc="ptw -- --cov=. --cov-report= --cov-branch -s"
alias ptwcc="cat .compile_suite | grep \"^[^#;]\" | xargs ptwc"
alias pyapprove="pytest --approvaltests-add-reporter=\"tmux-vim-diff.sh\" --cov=. --cov-report= --cov-branch -s"
alias pyapprovec="cat .compile_suite | xargs pyapprove"

alias gitclean="sh ~/.scripts/git_clean.sh"

alias kube_test="gcloud config set project spotl-media-test && gcloud container clusters get-credentials spotl-test-gke"
alias kube_prod="gcloud config set project spotl-media-prod && gcloud container clusters get-credentials spotl-prod-gke"
alias kubec="sh ~/.scripts/kubec.sh"

alias choose_microphone="python3 ~/.scripts/choose_microphone.py"
alias autoclick="for i in {1..999}; do xdotool click --repeat 2 --delay 10 1; sleep 6; done"
