@echo off
@REM Manually export pyproject.toml defined environments to requirements.txt files for
@REM use by CI and tox pipelines

uv export --format requirements.txt --no-dev --no-hashes --output-file requirements/requirements.txt
uv export --format requirements.txt --no-hashes --output-file requirements/requirements-dev.txt
uv export --format requirements.txt --only-group pytest --no-hashes --output-file requirements/requirements-pytest.txt
uv export --format requirements.txt --only-group mypy --no-hashes --output-file requirements/requirements-mypy.txt
uv export --format requirements.txt --only-group mkdocs --no-hashes --output-file requirements/requirements-mkdocs.txt