#
# Provides handy aliases for docker and docker-compose
#

$(boot2docker shellinit 2>/dev/null)

alias b2d='boot2docker'
alias b2di='$(boot2docker shellinit)'
alias dc='docker-compose'
