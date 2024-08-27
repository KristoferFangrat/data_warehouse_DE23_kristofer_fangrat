import dlt
import pandas as pd
from pathlib import Path
import os


@dlt.resource(write_disposition="replace")
def load_snowflake_resource(file_path: str, **kwargs):
    df = pd.read_excel(file_path, **kwargs)
    yield df.to_dict(orient="records")


if __name__ == "__main__":
    working_directory = Path(__file__).parent
    os.chdir(working_directory)

    pipeline = dlt.pipeline(
        pipeline_name='load_snowflake',
        destination='snowflake',
        dataset_name='staging',  # schema
    )

    file_path = working_directory / "data" / "iFood.xlsx"
    if not file_path.exists():
        raise FileNotFoundError(f"File {file_path} does not exist")

    data = list(load_snowflake_resource(file_path))

    print(data)  # Debugging: Print the data to ensure it's loaded correctly.

    load_info = pipeline.run(data, table_name="marketing_data")  # You can change "marketing_data" to any table name you want.

    print(load_info)  # Print information about the load process.

