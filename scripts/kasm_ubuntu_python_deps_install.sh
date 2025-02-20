#!/usr/bin/env bash
# exit immediately upon error
set -e

apt-get update

# Install Rust (pendulum, pydantic, and other Python packages are leveraging Rust now)
# https://rustup.rs/#
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

. "$HOME/.cargo/env"

# Install pyenv and add it to the path
# https://github.com/pyenv/pyenv?tab=readme-ov-file#installation
curl -fsSL https://pyenv.run | bash

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# Install Python 3.13 and make it the global default Python interpreter
pyenv install 3.13.2
pyenv global 3.13.2