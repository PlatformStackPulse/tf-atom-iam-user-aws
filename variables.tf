variable "path" {
  description = "Path for the IAM user"
  type        = string
  default     = "/"
  validation {
    condition     = can(regex("^/", var.path))
    error_message = "path must start with /."
  }
}

variable "force_destroy" {
  description = "Destroy user even if it has non-Terraform-managed access keys, login profile, or MFA devices"
  type        = bool
  default     = false
}
