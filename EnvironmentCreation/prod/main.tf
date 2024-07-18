module "apache_vm" {
  source = "../../modules"

  project_id       = "sukrit-singh-426716"
  region           = "us-central1"
  backend_bucket   = "bucket67ut"
  environment      = "prod"  
