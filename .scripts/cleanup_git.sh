git checkout develop
git branch --merged | egrep -v "(^\*|master|develop)" | xargs git branch -d
git remote prune origin
