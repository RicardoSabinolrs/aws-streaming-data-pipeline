module "iam_punk_api" {
  source             = "./modules/iam"
  kinesis_stream_arn = module.data_stream.kinesis_arn
  bucket_raw_arn     = module.raw_data_record.bucket_arn
  bucket_cleaned_arn = module.cleaned_data_record.bucket_arn
  depends_on         = [module.data_stream, module.raw_data_record, module.cleaned_data_record]
}