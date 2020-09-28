module "raw_data_record" {
  source      = "./modules/bucket"
  bucket_name = var.bucket_name_raw
}

module "cleaned_data_record" {
  source      = "./modules/bucket"
  bucket_name = var.bucket_name_cleaned
}