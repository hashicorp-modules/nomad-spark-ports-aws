variable "create" {
  description = "Create Module, defaults to true."
  default     = true
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
  description = "Optional map of tags to set on resources, defaults to empty map."
  type        = "map"
  default     = {}
}
