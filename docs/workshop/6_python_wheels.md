## Python Wheels
To make our Python code re-usable, we'll need to properly arrange it into a **package**.
The special `.zip` format for a Python package is called a **wheel** with the `.whl`
filename extension.

Python wheels can be distributed manually, stored as part of a GitHub or GitLab repository
though Continuous Integration (CI) automation, or published to the [PyPi repository](https://pypi.org/)
where Python's built-in package manager, `pip`, looks when running `pip install <wheel name>`.

## Poetry
This workshop uses [Poetry](https://python-poetry.org/) to manage the `avengercon` Python package.

!!! note "Free Wheeling"
1. Can you use Poetry to export the `avengercon` package to a `.whl` file?

2. What is the Poetry command to publish a package directly to PyPi so anyone in the world
can use it with a `pip install`?

3. In a new directory, can you create an entirely new package in a new directory using Poetry?

4. Create a `__main__.py` file in your newly created python package
``` python
if __name__ == "__main__":
    print("Hello, World!")
```
    - What is special about `__main__.py` in a Python package?
    - How can we properly execute the function we just added to `__main__.py`?

## Anaconda and `conda` packages
You're likely familiar with [Jupyter Notebooks](https://jupyter.org/). We'll use some
in the next section covering Dask. Jupyter relies on the [`Anaconda`](https://www.anaconda.com/download)
Python package manager and ecosystem. Anaconda uses **conda** packages instead of wheels.
If your Python data engineering code is destined to be mostly run in Jupyter Notebooks
and an Anaconda environment, you'll instead want to checkout [the conda packing documentation](https://docs.conda.io/projects/conda-build/en/stable/user-guide/tutorials/build-pkgs.html)