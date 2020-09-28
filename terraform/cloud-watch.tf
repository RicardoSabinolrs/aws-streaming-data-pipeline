module "cloud_watch" {
  source              = "./modules/event-bridge"
  lambda_function_arn = module.punk_api_raw_data.lambda_function_arn
  depends_on          = [module.punk_api_raw_data]
}