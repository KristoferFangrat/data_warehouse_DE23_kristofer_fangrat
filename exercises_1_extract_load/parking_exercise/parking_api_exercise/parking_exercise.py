import dlt
import json
import requests
import pandas as pd
from pathlib import Path
import os

# url = "https://openparking.stockholm.se/LTF-Tolken/v1/servicedagar/weekday/måndag?outputFormat=json&apiKey=6f8484f7-4a46-40bc-b273-27b3d2aeb45d"

def _get_parking(url):
    headers = {'accept': 'application/json'}
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    return json.loads(response.content.decode('utf8'))


@dlt.resource(write_disposition="replace")
def parking_exercise_resource():
    url = "https://openparking.stockholm.se/LTF-Tolken/v1/servicedagar/weekday/måndag?outputFormat=json&apiKey=6f8484f7-4a46-40bc-b273-27b3d2aeb45d"
    for ad in _get_parking(url)["features"]:
        yield ad

def run_pipeline(table_name):
    pipeline = dlt.pipeline(
        pipeline_name="parking_exercise",
        destination="snowflake",
        dataset_name="staging",
    )

    load_info = pipeline.run(parking_exercise_resource(), table_name=table_name)
    print(load_info)


if __name__ == "__main__":
    # specify the pipeline name, destination and dataset name when configuring pipeline,
    # otherwise the defaults will be used that are derived from the current script name
    working_directory = Path(__file__).parent
    os.chdir(working_directory)
    table_name = "parking_data"
    run_pipeline(table_name)
    

