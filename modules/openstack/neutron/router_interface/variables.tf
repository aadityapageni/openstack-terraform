variable "router_id" {
  description = "The ID of the OpenStack router"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to attach to the router"
  type        = string
}
