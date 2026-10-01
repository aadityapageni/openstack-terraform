variable "pool" {
  description = "Name of the external network (floating IP pool) to allocate the address from"
  type        = string
}

variable "instance_id" {
  description = "ID of the instance to assign the floating IP to; its port is looked up automatically. Set exactly one of instance_id or port_id."
  type        = string
  default     = null
}

variable "port_id" {
  description = "ID of an existing port to assign the floating IP to (alternative to instance_id). Set exactly one of instance_id or port_id."
  type        = string
  default     = null
}

variable "network_id" {
  description = "Network ID of the instance port to use when looking up instance_id (only needed if the instance has multiple NICs)"
  type        = string
  default     = null
}

variable "fixed_ip" {
  description = "Fixed (private) IP of the port to map the floating IP to; only required if the port has multiple fixed IPs"
  type        = string
  default     = null
}

variable "description" {
  description = "Description of the floating IP"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for the floating IP"
  type        = list(string)
  default     = []
}
