"""
Tests to verify the Celery scheduler, worker pool, and Avengercon tasks
pytest-celery is a docker based testing solution for Celery deployments.
A nice demo of how to create a custom worker node based on a Dockerfile and inject it into the testing cluster
is demonstrated in the documentation at:
https://docs.celeryq.dev/projects/pytest-celery/en/stable/getting-started/next-steps.html#mounting-src

For now, we're going to keep these tests very simple based on the assumption of an already running Celery cluster
deployed via docker compose
"""

from typing import Optional, Any

from avengercon.celery import verify_celery_connection
from avengercon.celery.tasks import hello_avengercon
from celery.result import AsyncResult


def test_celery_client_connect() -> None:
    """
    Validate that the Celery scheduler can be reached.

    Returns: None

    """
    l_connection_status: bool = verify_celery_connection()
    assert l_connection_status is True


def test_hello_workshop() -> None:
    """
    Run a basic hello world style task and verify that it returns data from a worker.

    Returns: None

    """
    result_pointer: AsyncResult = hello_avengercon.delay()
    result: Optional[Any] = result_pointer.get(timeout=2)
    assert isinstance(result, str)
    assert result == "Hello, Avengercon! <3 Celery"
