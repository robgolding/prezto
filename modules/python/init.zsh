#
# Enables local Python package installation.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#

# Load manually installed pyenv into the shell session.
if [[ -s "$HOME/.pyenv/bin/pyenv" ]]; then
  path=("$HOME/.pyenv/bin" $path)
  eval "$(pyenv init -)"

# Load package manager installed pyenv into the shell session.
elif (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"

  # load pyenv-virtulenv if it exists
  if (( $+commands[pyenv-virtualenv-init] )); then
    eval "$(pyenv-virtualenv-init -)"
  fi

# Prepend PEP 370 per user site packages directory, which defaults to
# ~/Library/Python on Mac OS X and ~/.local elsewhere, to PATH.
else
  if [[ "$OSTYPE" == darwin* ]]; then
    path=($HOME/Library/Python/*/bin(N) $path)
  else
    # This is subject to change.
    path=($HOME/.local/bin $path)
  fi
fi

# Return if requirements are not found.
if (( ! $+commands[python] && ! $+commands[pyenv] )); then
  return 1
fi

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Load virtualenvwrapper into the shell session.
if (( $+commands[virtualenvwrapper.sh] )); then
  # Set the directory where virtual environments are stored.
  export WORKON_HOME="$HOME/.virtualenvs"


  VIRTUALENVWRAPPER_PYTHON=python2

  source "$commands[virtualenvwrapper.sh]"
fi

# Set pipenv environment variables

export PIPENV_VENV_IN_PROJECT=true

#
# Aliases
#

alias py='python'
