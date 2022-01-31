variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket to create"
}

variable "versioning_enabled" {
  type        = bool
  description = "When true the s3 bucket contents will be versioned"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Additional tags to apply to the bucket"
  default     = {}
}

variable "force_destroy" {
  type    = bool
  default = false
}

variable "data_sensitivity" {
  type        = string
  description = "Defaults to low. For buckets with PII or other sensitive data, the tag data_sensitivity: high must be applied."
  default     = "low"

  validation {
    condition     = var.data_sensitivity == "high" || var.data_sensitivity == "low"
    error_message = "The data_sensitivity value must be \"high\" or \"low\"."
  }
}

variable "log_bucket_id" {
  type        = string
  description = "The name of the access logs bucket"
}

variable "data_expiry" {
  type        = string
  description = "1-day, 1-week, 1-month, 90-days, 6-months, 1-year, 7-years or 10-years"
}

variable "kms_key_policy" {
  description = "The KMS key policy to attach when creating a KMS key"
  type        = string
}