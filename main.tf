module "vpc" {
  source          = "./module/network"
  project_id      = var.project_id
  network_name    = "dataflow-vpc"
  shared_vpc_host = false
}

resource "random_id" "random_suffix" {
  byte_length = 4
}

locals {
  gcs_bucket_name = "tmp-dir-bucket-${random_id.random_suffix.hex}"
}

module "dataflow-bucket" {
  source        = "./module/bucket"
  name          = local.gcs_bucket_name
  region        = var.region
  project_id    = var.project_id
  force_destroy = var.force_destroy
}

module "dataflow-job" {
  source  = "./module/dataflow"
  project_id            = var.project_id
  name                  = "wordcount-terraform-example"
  on_delete             = "cancel"
  region                = var.region
  zone                  = var.zone
  max_workers           = 1
  template_gcs_path     = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location     = module.dataflow-bucket.bucket_name
  service_account_email = var.service_account_email
  network_self_link     = module.vpc.network_self_link
  subnetwork_self_link  = module.vpc.subnets_self_links[0]
  machine_type          = "n1-standard-1"

  parameters = {
    inputFile = "gs://dataflow-samples/shakespeare/kinglear.txt"
    output    = "gs://${local.gcs_bucket_name}/output/my_output"
  }
}
