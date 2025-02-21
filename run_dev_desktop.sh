#! /bin/bash
# stop execution instantly on non-zero status. This is to know location of error
set -e

export DOCKER_BUILDKIT=1

while getopts 'mlh' opt; do
  echo "Access the dev desktop at https://localhost:6901";
  case "${opt}" in
    h)
      echo "Default AMD64 (e.g. intel, AMD) dev desktop image. -m uses an ARM based dev desktop (e.g. Mac M series), -l locally builds and runs the dev desktop"
      ;;
    m)
      echo "Using an ARM architecture dev desktop image."
      docker compose -f docker-compose-dev-container.arm64.yaml down --remove-orphans
      docker compose -f docker-compose-dev-container.arm64.yaml up --build
      ;;
    l)
      echo "Locally building dev desktop image. It's recommended to use a pre-built option with -m or no flag"
      docker compose -f docker-compose-dev-container.local-build.yaml down --remove-orphans
      docker compose -f docker-compose-dev-container.local-build.yaml up --build
      ;;
    ?)
      echo "Using an AMD64 architecture dev desktop image."
      docker compose -f docker-compose-dev-container.amd64.yaml down --remove-orphans
      docker compose -f docker-compose-dev-container.amd64.yaml up --build
      ;;
  esac
done
