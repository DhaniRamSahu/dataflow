
variable "project_id" {
  type        = string
  description = "The project in which the resource belongs. If it is not provided, the provider project is used."
}

variable "name" {
  type        = string
  description = "The name of the dataflow job"
}

variable "template_gcs_path" {
  type        = string
  description = "The GCS path to the Dataflow job template."
}

variable "temp_gcs_location" {
  type        = string
  description = "A writeable location on GCS for the Dataflow job to dump its temporary data."
}

variable "parameters" {
  type        = map(string)
  description = "Key/Value pairs to be passed to the Dataflow job (as used in the template)."
  default     = {}
}

variable "max_workers" {
  type        = number
  description = " The number of workers permitted to work on the job. More workers may improve processing speed at additional cost."
  default     = 1
}

variable "on_delete" {
  type        = string
  description = "One of drain or cancel. Specifies behavior of deletion during terraform destroy. The default is cancel."
  default     = "cancel"
}

variable "region" {
  type        = string
  description = "The region in which the created job should run. Also determines the location of the staging bucket if created."
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "The zone in which the created job should run."
  default     = "us-central1-a"
}

variable "service_account_email" {
  type        = string
  description = "The Service Account email that will be used to identify the VMs in which the jobs are running"
  default     = ""
}

variable "subnetwork_self_link" {
  type        = string
  description = "The subnetwork self link to which VMs will be assigned."
  default     = ""
}

variable "network_self_link" {
  type        = string
  description = "The network self link to which VMs will be assigned."
  default     = "default"
}

variable "machine_type" {
  type        = string
  description = "The machine type to use for the job."
  default     = ""
}

variable "ip_configuration" {
  type        = string
  description = "The configuration for VM IPs. Options are 'WORKER_IP_PUBLIC' or 'WORKER_IP_PRIVATE'."
  default     = null
}

variable "kms_key_name" {
  type        = string
  description = "The name for the Cloud KMS key for the job. Key format is: projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY"
  default     = null
}

variable "labels" {
  type        = map(string)
  description = "User labels to be specified for the job."
  default     = {}
}

variable "additional_experiments" {
  type        = list(string)
  description = "List of experiments that should be used by the job. An example value is `['enable_stackdriver_agent_metrics']`"
  default     = []
}