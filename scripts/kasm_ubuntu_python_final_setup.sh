#!/usr/bin/env bash
# exit immediately upon error
set -e

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

echo python --version

# Install Poetry
# https://python-poetry.org/docs/#installing-with-the-official-installer
curl -sSL https://install.python-poetry.org | python -

# Add Poetry to current shell path
export PATH="/home/kasm-user/.local/bin:$PATH"

## Debugging sanity check
poetry --version

poetry env activate
source $HOME/Desktop/avengercon_2025/.venv/bin/activate
poetry install