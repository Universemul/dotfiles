# Github info in prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[36m\]\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\n$ "

# Some Aliases

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias pacman='sudo pacman'
alias rsync-copy='rsync -avz --progress -h'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Cblue - %cn %Creset' --abbrev-commit --date=relative"
alias py='python'
alias source='source $HOME/.bashrc'

# Kubernetes
alias k='kubectl'

# Docker
alias d='docker'
alias dc='docker-compose'

# Function
join_lines() {
    tr '\n' ';' < $1 | pbcopy
}
