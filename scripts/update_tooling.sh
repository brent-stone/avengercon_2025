#!/usr/bin/env bash
# exit immediately upon error
set -e

if ! uv --version | grep -q "uv"; then
  echo "uv is not installed. Please install uv then retry."
  printf "\e]8;;https://docs.astral.sh/uv/getting-started/installation/#installation-methods\e\\UV Installation Documentation (ctrl+left click)\n\e]8;;\e\\"
#  exit
fi

if ! python --version | grep -q "Python"; then
  echo "Python is not installed. Installing python."
  uv python install 3.13
fi

# Update uv
case "$(uname -sr)" in

   Darwin*)
     echo 'Mac OS detected... using brew to update uv'
     brew upgrade uv
     ;;

   Linux*Microsoft*)
     echo 'Windows WSL detected... using uv internal update tool'
     uv self update
     ;;

   Linux*)
     echo 'Linux detected... using uv internal update tool'
     uv self update
     ;;

   CYGWIN*|MINGW*|MSYS*)
     echo 'MS Windows detected... using uv internal update tool'
     uv self update
     ;;

   *)
     echo 'Unknown operating system. Please manually update uv.'
     ;;
esac

# Ensure a virtual environment has been created
uv venv --allow-existing

# Activate the virtual environment if not already active
source .venv/bin/activate

# Ensure the currently in use python distribution is using the latest pip
pip install --upgrade pip

# Upgrade dependencies
uv sync --upgrade

# Output a success notice to the developer.
echo "🚀 Your dev environment is on the latest hotness."
echo "Run tox before committing to verify nothing broke."