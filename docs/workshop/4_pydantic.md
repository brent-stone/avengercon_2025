## Python's Semi-Structured Data Parser
If you're using Python to read semi-structured data like JSON or XML that has more than
1-layer of data (which Pandas can gracefully handle), you should be using Pydantic. No 
exceptions. Anything you wrote custom code to handle is already implemented in Pydantic
using a 100x faster rust-optimized backend and a much more maintainable way.

### Checkout the documentation
The [Pydantic documentation](https://docs.pydantic.dev/latest/) is very user friendly.
Look familiar? The author is the one who inspired me (and by consequence, the Joint
dev community) to start using [`mkdocs-material`](https://squidfunk.github.io/mkdocs-material/) 
for markdown based documentation.

### Taking Pydantic for a test drive
[The Warship Dataset](https://www.kaggle.com/datasets/queyrusi/the-warship-dataset) includes 40 years of Heavy-Class warship data from Russia, 
Turkey, and the United States. Let's download and save it to `/data/Warships`. Try
to parse it with a Python class we make by inheriting from the Pydantic `BaseModel`.

!!! note "Challenges"
    - Can you create a `BaseModel` that successfully parses the JSON?

    - Are your fields using specific types to coerce and validate the data?

    - How can we convert our Pydantic model into a Python dictionary?

    - Are you able to use a loop to iterate over all data in the Pydantic model and
    write out to a CSV formatted file?