#! /bin/bash
# stop execution instantly on non-zero status. This is to know location of error
set -e

export DOCKER_BUILDKIT=1

# Networks and other thing from a previous run may still be around
# This ensures a relatively clean slate
docker compose -f docker-compose.avengercon-2025.celery.yaml down

docker compose -f docker-compose.avengercon-2025.celery.yaml up --build