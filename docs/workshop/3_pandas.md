## Pandas probably does more than you realize

Pandas has many [optional dependencies](https://pandas.pydata.org/docs/getting_started/install.html#optional-dependencies)
that greatly extend what the `DataFrame` API is capable of. A few examples:

1. `excel`: Directly read and write `.xlsx` excel files
2. `xml`: Directly read and write `.xml` semi-structures files
3. `postgresql`,`mysql`,etc.: Directly read and write to a database
4. `parquet`: Directly read and write to a common data lakehouse format
5. `aws`: Directly read and write to an Amazon Web Services (AWS) S3 bucket (including MinIO)
6. `gcp`: Read and write to Google Cloud Platform (GCP) Cloud Storage

A caution is using the right tool for the job. Excel, XML, and other **semi-structured**
data formats can be difficult to _wrangle_ into the `DataFrame` **structured**, typed, and
columnar data structure. [**Pydantic**](4_pydantic.md) will often be a much better 
intermediate tool that creates self documenting code for how business rules were applied
to convert semi-structured JSON or XML data into **structured** data.

## Plain 'ol Pandas Workflow
We'll download the [Rainfall of Iranian Cities](https://www.kaggle.com/datasets/mohammadrahdanmofrad/average-monthly-precipitation-of-iranian-cities?select=Rainfall_Iran_19012022.csv)
datasets into `/data/IranRainfall` to level set on basic use of pandas [`read_csv()`](https://pandas.pydata.org/docs/reference/api/pandas.read_csv.html#pandas.read_csv) and
[`read_excel()`](https://pandas.pydata.org/docs/reference/api/pandas.read_excel.html) 
functions. The data provides monthly precipitation data for 31 cities in Iran from 1901 
to 2022 in Command Separated Value (CSV) and Excel Spreadsheet (XLSX) formats.

## Now with an S3 bucket
The provided `avengercon` Python package provides an authenticated MinIO Client as follows:

``` python
from avengercon.minio import get_minio_client()

my_client: Optional[Minio] = get_minio_client()
```

The avengercon package also includes a Pydantic model with all your MinIO credentials and endpoint information
``` python
from avengercon.minio.config import minio_config
print(minio_config.endpoint)
print(minio_config.access_key)
print(minio_config.secret_key.get_secret_value())
``` 

Likewise, the **"Hello, Workshop!"** page described how to access our local MinIO server
which supports creating buckets and drag-drop data uploads.

The [MinIO Python SDK documentation](https://min.io/docs/minio/linux/developers/python/API.html)
provides details and example code for the MinIO Client [`list_buckets()`](https://min.io/docs/minio/linux/developers/python/API.html#list_buckets),
[`list_objects()`](https://min.io/docs/minio/linux/developers/python/API.html#list_objects), and [`get_object()`](https://min.io/docs/minio/linux/developers/python/API.html#get_object)
functions.

Finally, the [Pandas documentation](https://pandas.pydata.org/pandas-docs/stable/user_guide/io.html#reading-writing-remote-files)
provides an example of how to directly read and write remote files in an S3 bucket. It
points to [the S3FS](https://s3fs.readthedocs.io/en/latest/#s3-compatible-storage) Python package it's
using for how to authenticate.

!!! note "Can you successfully read a remote file in S3?"
    - Are you able to successfully adjust the `file_uploader.py` example on the
    MinIO Python SDK to read a file using the provided `get_minio_client()` function?

    - Are you able to use the information in your `.env` file and the Pandas + S3FS documentation
    to use a Pandas `DataFrame`'s `read_csv()` function to directly read from a MinIO S3 bucket?
        - Hint #1: The `storage_options` argument with a `"client_kwargs"` keyed nested dictionary 
        may be an easy approach for authenticating your credentials.

        - Hint #2: Try a search on Google or ChatGPT for "Pandas read_csv MinIO" or "pandas s3fs read from minio"


