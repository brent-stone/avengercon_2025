### Open the Prefect User Interface

Right-click and "open in new tab"

[Prefect :simple-prefect:](http://prefect.localhost:57073/dashboard){ .md-button .md-button--primary}

![Prefect](1_images/prefect.png)

### Integrating Prefect with AWS S3/MinIO

In your IDE with your virtual environment activated ([as described earlier](1_hello_workshop.md)),
try making and running a new python script in the `avengercon_2024` directory.

``` py title="testing.py"
from avengercon.prefect.flows import hello_prefect_flow
from avengercon.prefect.storage import create_default_prefect_blocks, create_default_prefect_buckets

print(hello_prefect_flow())
create_default_prefect_buckets()
create_default_prefect_blocks()
```

Take a look at the "Blocks" portion of the Prefect UI. You should see `prefect-artifacts`
and `prefect-flows` as registered S3-like buckets. Clicking the link on either will
show instructions on how to use these buckets in the future to cache both the files your
team is working on and the code you're using to do so. This may be particularly helpful
when your operators may want to trigger a pre-defined series of steps for new data by
triggering a [deployment](https://docs.prefect.io/latest/concepts/deployments/) that
uses a [flow](https://docs.prefect.io/latest/concepts/flows/) the dev team stored in a
block.