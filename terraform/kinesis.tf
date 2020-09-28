module "data_stream" {
  source                   = "./modules/kinesis/stream"
  kinesis_stream_name      = var.kinesis_stream_name
  kinesis_shard_count      = var.kinesis_shard_count
  kinesis_retention_period = var.kinesis_retention_period
}

module "kinesis_firehose_raw_delivery" {
  source                 = "./modules/kinesis/firehose/raw"
  kinesis_stream_arn     = module.data_stream.kinesis_arn
  role_arn               = module.iam_punk_api.firehose_delivery_role_arn
  destination_bucket_arn = module.raw_data_record.bucket_arn
  depends_on             = [module.iam_punk_api, module.raw_data_record, module.data_stream]
}

module "kinesis_firehose_cleaned_delivery" {
  source                         = "./modules/kinesis/firehose/cleaned"
  kinesis_stream_arn             = module.data_stream.kinesis_arn
  role_arn                       = module.iam_punk_api.firehose_delivery_role_arn
  lambda_processor_name_arn      = module.punk_api_cleaned_data.lambda_processor_arn
  destination_bucket_arn         = module.cleaned_data_record.bucket_arn
  depends_on                     = [module.iam_punk_api, module.cleaned_data_record, module.data_stream, module.punk_api_cleaned_data]
}