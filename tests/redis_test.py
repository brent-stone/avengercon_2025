"""
Tests to verify the Redis submodule is behaving well
"""

from avengercon import redis
from pytest import fail
from redis import Redis
from typing import Optional, List


def test_redis_client_connect() -> None:
    """
    Validate that the Redis client can be created

    Returns: None

    """
    l_client: Optional[Redis] = redis.get_redis_client()
    assert isinstance(l_client, Redis)


def test_redis_data_crud() -> None:
    """
    Test Create, Read, Update, Delete functionality using the redis client
    Returns: None

    """
    l_client: Optional[Redis] = redis.get_redis_client()
    assert isinstance(l_client, Redis)

    # Test Create
    l_client.set("test_redis_data_crud", "test")
    # Test Read
    retrieved_value: Optional[str] = l_client.get("test_redis_data_crud")  # type: ignore
    assert retrieved_value == "test"
    # Test Update
    l_client.set("test_redis_data_crud", "test2")
    retrieved_value = l_client.get("test_redis_data_crud")  # type: ignore
    assert retrieved_value == "test2"
    # Test Delete
    l_client.delete("test_redis_data_crud")
    retrieved_value = l_client.get("test_redis_data_crud")  # type: ignore
    assert retrieved_value is None
