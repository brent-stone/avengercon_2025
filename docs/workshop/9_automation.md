### Airflow
[Airflow](https://airflow.apache.org/) is the "OG" of Python data engineering automation.
It's offered as open source code or a fully managed service on various cloud providers
(e.g. GCP's DataProc). It still retains a large market share but can be difficult to use.
These difficulties led to the rise of newer tools like Prefect or Pachyderm.

### Prefect
![Prefect](1_images/prefect.png)

[Prefect](https://www.prefect.io/) allows automation and monitoring of Python by adding 
decorators (`@`) above otherwise normal Python functions. The way your code is packaged
and automated is very similar the Celery... just much more polished.

### Pachyderm
[Pachyderm](https://www.pachyderm.com/) also enabled python data engineering automation
but takes a container-centric approach. Unlike Aiflow or Prefect which are mostly Python
native tools, Pachyderm packages each step of a workflow in a container to maximize
consistency and portability. This approach allows it to expand beyond Python to also support
java, scala, and possibly more as time goes on.

### Other fully managed or semi-proprietary solutions
Here's a quick rundown of other data engineering pipeline tools that have significant
market share. These aren't necessarily specific to python but can help augment Python-based
ETL or ELT workflows.

1. [Airbyte](https://airbyte.com/): Self-managed and fully managed options. Based on largely
point-and-click "connectors" for source and sinks of data.

2. [Fivetran](https://www.fivetran.com/): One of the first offerings in the data engineering
space and still widely used.

3. [Stitch](https://www.stitchdata.com/): Another of the earlier data engineering companies.

4. [AWS Glue](https://aws.amazon.com/glue/): Amazon Web Service's proprietary ETL pipeline tool.

5. [Azure Fabric](https://www.microsoft.com/en-us/microsoft-fabric): Microsoft's fully-managed offering.

6. [DBT](https://www.getdbt.com/): Meteorically taking over the ELT market for data pipelines.
More on DBT and Object Relational Mapper (ORM) tooling on the next page.

[//]: # (Right-click and "open in new tab")

[//]: # ()
[//]: # ([Prefect :simple-prefect:]&#40;http://prefect.localhost:57073/dashboard&#41;{ .md-button .md-button--primary})



[//]: # (### Integrating Prefect with AWS S3/MinIO)

[//]: # ()
[//]: # (In your IDE with your virtual environment activated &#40;[as described earlier]&#40;1_hello_workshop.md&#41;&#41;,)

[//]: # (try making and running a new python script in the `avengercon_2024` directory.)

[//]: # ()
[//]: # (``` py title="testing.py")

[//]: # (from avengercon.prefect.flows import hello_prefect_flow)

[//]: # (from avengercon.prefect.storage import create_default_prefect_blocks, create_default_prefect_buckets)

[//]: # ()
[//]: # (print&#40;hello_prefect_flow&#40;&#41;&#41;)

[//]: # (create_default_prefect_buckets&#40;&#41;)

[//]: # (create_default_prefect_blocks&#40;&#41;)

[//]: # (```)

[//]: # ()
[//]: # (Take a look at the "Blocks" portion of the Prefect UI. You should see `prefect-artifacts`)

[//]: # (and `prefect-flows` as registered S3-like buckets. Clicking the link on either will)

[//]: # (show instructions on how to use these buckets in the future to cache both the files your)

[//]: # (team is working on and the code you're using to do so. This may be particularly helpful)

[//]: # (when your operators may want to trigger a pre-defined series of steps for new data by)

[//]: # (triggering a [deployment]&#40;https://docs.prefect.io/latest/concepts/deployments/&#41; that)

[//]: # (uses a [flow]&#40;https://docs.prefect.io/latest/concepts/flows/&#41; the dev team stored in a)

[//]: # (block.)