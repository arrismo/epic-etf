import kagglehub
import os
os.environ['KAGGLEHUB_CACHE'] = 'raw_data/'
# Download latest version
path = kagglehub.dataset_download(
    "unmoved/magnificent-7-past-10-years-prices-updated-daily")

print("Path to dataset files:", path)