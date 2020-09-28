import json
import os
from logging import getLogger

import boto3
import requests

log = getLogger(__name__)

URL: str = 'https://api.punkapi.com/v2/beers/random'


def get_raw_data_from_punk_api(url: str):
    try:
        response = requests.get(url)
        return response.json()[0]
    except Exception as err:
        log.info('An error occurred during the request. Error: ', err)
        raise err


def message_producer_to_kinesis(data: str, data_stream_name: str):
    client = boto3.client('kinesis')
    log.info('Sending message to Kinesis Stream')
    return client.put_record(
        Data=bytes(data, 'utf-8'),
        PartitionKey='0',
        StreamName=data_stream_name
    )


def lambda_handler(event, context):
    log.info('Getting records from Punk API')
    record = get_raw_data_from_punk_api(URL)
    log.info('Procucer data on Kinesis Stream')
    return message_producer_to_kinesis(
        data=json.dumps(
            record,
            ensure_ascii=False
        ),
        data_stream_name=os.environ['KINESIS_STREAM_NAME']
    )
