variable "provision" {
  default     = "true"
  description = "Override to prevent provisioning resources in this module, defaults to \"true\"."
}

variable "name" {
  default     = "nomad-spark-ports-aws"
  description = "Name for resources, defaults to \"nomad-spark-ports-aws\"."
}

variable "vpc_id" {
  description = "VPC ID to provision resources in."
}

variable "cidr_blocks" {
  type        = "list"
  description = "CIDR blocks for Security Groups."
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Optional map of tags to set on resources, defaults to empty map."
}
