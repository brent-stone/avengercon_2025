#!/usr/bin/env bash
# exit immediately upon error
set -e

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc

echo python --version

# Install Poetry
# https://python-poetry.org/docs/#installing-with-the-official-installer
curl -sSL https://install.python-poetry.org | python -

# Add Poetry to current shell path
echo 'export PATH="/home/kasm-user/.local/bin:$PATH"' >> ~/.bashrc

## Debugging sanity check
poetry --version

poetry env activate
source $HOME/Desktop/avengercon_2025/.venv/bin/activate
poetry install