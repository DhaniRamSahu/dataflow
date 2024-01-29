variable "project_id" {
  description = "The ID of the project where this VPC will be created"
  type        = string
  default     = "spheric-crowbar-406014"
}

variable "region" {
  type        = string
  description = "The region in which the bucket will be deployed"
  default     = "europe-west1"

}


variable "zone" {
  type        = string
  description = "The zone in which the dataflow job will be deployed"
}

variable "service_account_email" {
  type        = string
  description = "The Service Account email used to create the job."
  default = "poc-471@spheric-crowbar-406014.iam.gserviceaccount.com"
}

variable "force_destroy" {
  type        = bool
  description = "When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run."
  default     = true
}

variable "name" {
  type        = string
  description = "The name of the bucket."
}
