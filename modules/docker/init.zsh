#
# Provides handy aliases for docker and docker-compose
#

function dmi {
    eval $(docker-machine env $1)
}

alias dm='docker-machine'
alias dms='docker-machine start default'

alias dc='docker-compose'
