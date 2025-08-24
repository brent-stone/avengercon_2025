#!/usr/bin/env bash
# exit immediately upon error
set -e

echo python --version

# Install uv
# https://docs.astral.sh/uv/getting-started/installation/#standalone-installer
curl -LsSf https://astral.sh/uv/install.sh | less

# Add uv to current shell path
echo 'export PATH="/home/kasm-user/.local/bin:$PATH"' >> ~/.bashrc

## Debugging sanity check
uv --version

uv venv --allow-existing
source $HOME/Desktop/avengercon_2025/.venv/bin/activate
uv sync