variable "region" {
  type        = string
  description = "The region where the resources are created"
  default     = "ap-southeast-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block used by the VPC"
  default     = "10.0.0.0/16"
}

variable "prefix" {
  type        = string
  description = "Prefix used for naming AWS resources"
  default     = "hellocloud"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
  default     = "dev"
}

variable "subnet_cidr_block" {
  type        = string
  description = "The CIDR block used by the subnet"
  default     = "10.0.10.0/24"
}

variable "ssh_allowed_cidr" {
  type        = string
  description = "CIDR block allowed to access SSH"
}