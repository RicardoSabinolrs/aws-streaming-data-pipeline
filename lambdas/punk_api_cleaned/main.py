import base64
import json

from logging import getLogger

logger = getLogger(__name__)


class DataTransformation:
    def __init__(self, records: list) -> None:
        self.records: list = records
        self.output: list = []
        self.final_data = {'id': ''}
        self.fields: list = [
            'id',
            'name',
            'tagline',
            'first_brewed',
            'description'
        ]

    def process(self) -> list:
        logger.info('Start Kinesis Firehose data transformation.')
        for record in self.records:
            payload: dict = self.__decompress(record.get('data', None))
            for key, value in payload.items():
                for field in self.fields:
                    if key == field:
                        package = {key: value}
                        self.final_data.update(package)

            data = self.__compress(self.final_data)
            output_record = {
                'recordId': record['recordId'],
                'result': 'Ok',
                'data': base64.b64encode(data).decode()
            }
            self.output.append(output_record)
        return self.output

    def __decompress(self, record) -> dict:
        payload = base64.b64decode(record['data'])
        logger.info('Payload data:', payload)
        return json.loads(payload)[0]

    def __compress(self, final_data):
        logger.info('Processed data:', final_data)
        return str(final_data).encode('utf-8')


def lambda_handler(event, context):
    output = DataTransformation(event.get('records', None)).process()
    logger.info('Successfully processed {} records.'.format(len(event['records'])))
    return dict(records=output)
