import os
import requests
import json
import dlt
from pathlib import Path
import pandas as pd
from dotenv import load_dotenv

load_dotenv()

def _get_parking(url):
    headers = {'accept': 'applicatioin/json'}
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    return json.loads(response.content.decode('utf8'))

@dlt.resource(write_disposition="replace")
def parking_exercise_resource():
    api_key = os.getenv("API_KEY")
    if not api_key:
        raise ValueError("API_KEY environment variable not set")
    url = f"https://openparking.stockholm.se/LTF-Tolken/v1/pmotorcykel/all?maxFeatures=100&outputFormat=json&apiKey={api_key}"
    for ad in _get_parking(url)["features"]:
        yield ad

def run_pipeline(table_name):
    pipeline = dlt.pipeline(
        pipeline_name="parking_motorcycle",
        destination="snowflake",
        dataset_name="staging_mc",
    )

    load_info = pipeline.run(parking_exercise_resource(), table_name=table_name)
    print(load_info)

if __name__ == "__main__":
    # specify the pipeline name, destination and dataset name when configuring pipeline,
    # otherwise the defaults will be used that are derived from the current script name
    working_directory = Path(__file__).parent
    os.chdir(working_directory)
    table_name = "parking_data_mc"
    run_pipeline(table_name)