# Aliases in this file are bash and zsh compatible

home=$HOME/.dots

# PS
alias psa="ps aux"
alias psg="ps aux | grep "

# Moving around
alias cdb='cd -'

# Show human friendly numbers and colors
alias df='df -h'
alias ll='ls -alGh'
alias ls='ls -Gh'
alias du='du -h -d 2'

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
alias ae='vim $home/zsh/aliases.zsh' #alias edit
alias ar='source $home/zsh/aliases.zsh'  #alias reload

# vim using
# mvim --version > /dev/null 2>&1
# MACVIM_INSTALLED=$?
# if [ $MACVIM_INSTALLED -eq 0 ]; then
#   alias vim="mvim -v"
# fi
alias vim="nvim"

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc'

# Git Aliases
alias gpl='git pull'
alias gcp='git cp'
alias gi='vim .gitignore'
alias guns='git unstage'
alias gunc='git uncommit'
alias gam='git amend --reset-author'

alias gff='git flow feature'
alias gffs='git flow feature start'
alias gffp='git flow feature publish'
alias gfff='git flow feature finish'
alias gffr='git flow feature rebase'

alias gfrs='git flow release start'
alias gfrf='git flow release finish -s'
alias gfrp='git flow release publish'
alias gfrr='git flow release rebase'

alias gfhs='git flow hotfix start'
alias gfhf='git flow hotfix finish -s'
alias gfhp='git flow hotfix publish'
alias gfhr='git flow hotfix rebase'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Zippin
alias gz='tar -zcvf'

alias ka9='killall -9'
alias k9='kill -9'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias lsnet="lsof -nP -i4TCP -sTCP:LISTEN"
alias ping="/usr/local/bin/grc ping"

# Python
alias py2="python2"
alias py3="python3"
alias py-build="python setup.py bdist_wheel"
alias pip-upgrade="pip freeze --local | grep -v '^\-e' | cut -f 1 -d = | xargs pip install -U"
alias repl="ptipython"


# Redis
alias rstage="redis-cli -h ant-core-staging-media2.n.collins.kg -p 6380"

# Pyenv
alias pec="pyenv virtualenv"
alias pea="pyenv activate"
alias ped="pyenv deactivate"
alias per="pyenv rehash"

# virtualbox
alias vbm="VBoxManage"
alias vbls="vbm list runningvms"
alias vblsa="vbm list vms"
alias vbs="vbm startvm --type headless"

# itermocil
alias it="itermocil"


# docker
alias dcp="docker-compose"
alias dma="docker-machine"
alias dsw="docker-swarm"
