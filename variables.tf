variable "region" {
  type        = string
  description = "AWS Region"
}

variable "ami_id" {
  type        = string
  default     = "ami-0a887e401f7654935"
  description = "Default AMI for Simple AWS machine"
}

variable "vpc_id" {
  type        = string
  description = "Default AWS VPC"
}

variable "public_key" {
  type        = string
  description = "Public key location"
}

