# Define Input Variables

variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "team" {
  type        = string
  description = "The team responsible for the resource."
  default     = "dev"
}

variable "key_pairs" {
  type        = string
  description = "Key Pairs Name"
  default     = "terraform-key"
}

# Variables for Cloud Terraform
variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key ID"
  type        = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Access Key"
  type        = string
}
