#! /bin/bash
# stop execution instantly on non-zero status. This is to know location of error
set -e

export DOCKER_BUILDKIT=1

GREEN="\e[32m"
BLUE="\e[34m"
ENDCOLOR="\e[0m"

# Environment variable paths used throughout the project
declare -a PathArray=(
  ".env" \
  ".localhost.env" \
)
# Iterate over the paths and remove the files if present
# The [@] operator is get all elements, space-separated
for l_path in "${PathArray[@]}"; do
  if [ -f "$l_path" ]; then
  rm "$l_path"
  fi
done

if [ -n "$1" ]; then
    # Apply override settings, if present
    DOMAIN="${1}"
    export DOMAIN
    echo -e "${GREEN}[INFO]${ENDCOLOR} DOMAIN is now set to ${BLUE}${DOMAIN}${ENDCOLOR}"
else
  echo -e "${GREEN}[INFO]${ENDCOLOR} Optionally provide a top level domain \
(e.g. mydomain.com) as an argument to this script to change which domain hosting is \
configured for. Default is 'localhost'"
  read -p ">> Enter your hosting top level domain [localhost]: " tld
  DOMAIN=${tld:-localhost}
  export DOMAIN
  echo -e "${GREEN}[INFO]${ENDCOLOR} DOMAIN is now set to ${BLUE}${DOMAIN}${ENDCOLOR}"
fi

# Run the initialization script
/bin/bash ./initialize_env.sh

# Stop any currently running containers for this project.
# Remove containers for services not defined in the Compose file.
# Remove named volumes declared in the volumes section of the Compose file and anonymous
# volumes attached to containers.
while getopts 'mlh' opt; do
  echo "Access the dev desktop at https://localhost:6901";
  case "${opt}" in
    h)
      echo "Default AMD64 (e.g. intel, AMD) dev desktop image. -m uses an ARM based dev desktop (e.g. Mac M series), -l for locally built dev desktop"
      ;;
    m)
      echo "Cleaning up ARM architecture dev desktop volume and container."
      docker compose -f docker-compose-dev-container.arm64.yaml down --remove-orphans --volumes
      ;;
    l)
      echo "Cleaning up locally built dev desktop volume and container"
      docker compose -f docker-compose-dev-container.local-build.yaml down --remove-orphans --volumes
      ;;
    ?)
      echo "Cleaning up AMD64 architecture dev desktop volume and container."
      docker compose -f docker-compose-dev-container..amd64.yaml down --remove-orphans --volumes
      ;;
  esac
done

