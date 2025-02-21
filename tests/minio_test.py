"""
Tests to verify the MinIO submodule is behaving well
"""
import avengercon
from pytest import fail
from minio import Minio
from typing import Optional, List

from avengercon.minio import BucketCreationResult


def test_minio_client_connect() -> None:
    """
    Validate that the MinIO client can be created

    Returns: None
    """
    l_client: Optional[Minio] = avengercon.minio.get_minio_client()
    if l_client is None:
        fail("No minio client connected. Ensure the minio service is running via docker compose.")
    assert isinstance(l_client, Minio)


def test_minio_bucket_creation() -> None:
    """
    Validate that a bucket can be created.

    Returns: None

    """
    l_test_bucket: List[str] = ["test_bucket"]
    l_result: avengercon.minio.schemas.BucketCreationResult = avengercon.minio.create_buckets(l_test_bucket)
    assert isinstance(l_result, BucketCreationResult)
    assert len(l_result.preexisting) + len(l_result.preexisting) >= 0
    assert len(l_result.failure) == 0


