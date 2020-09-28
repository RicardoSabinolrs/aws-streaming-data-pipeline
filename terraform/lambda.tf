module "punk_api_raw_trigger" {
  source               = "./modules/lambda/trigger"
  lambda_function_name = module.punk_api_raw_data.lambda_function_name
  source_arn           = module.cloud_watch.cloud_watch_event_rule_arn
  depends_on           = [module.cloud_watch, module.punk_api_raw_data]
}

module "punk_api_raw_data" {
  source                  = "./modules/lambda/function/raw"
  role_arn                = module.iam_punk_api.lambda_to_kinesis_stream_role_arn
  depends_on              = [module.iam_punk_api]
}

module "punk_api_cleaned_data" {
  source                  = "./modules/lambda/function/cleaned"
  role_arn                = module.iam_punk_api.lambda_raw_role_arn
}