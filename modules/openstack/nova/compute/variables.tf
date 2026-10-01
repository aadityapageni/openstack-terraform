variable "no_of_vm" {
  description = "Number of VMs to create"
  type        = number
}

variable "instance_name" {
  description = "Base name for the instances"
  type        = string
}

variable "image_name" {
  description = "The image name for the instances"
  type        = string
}

variable "flavor_name" {
  description = "The flavor name for the instances"
  type        = string
}

variable "key_pair" {
  description = "The SSH key pair name"
  type        = string
}

variable "security_group" {
  description = "The security group name"
  type        = string
}

variable "network_name" {
  description = "The network name to attach VMs to"
  type        = string
}
