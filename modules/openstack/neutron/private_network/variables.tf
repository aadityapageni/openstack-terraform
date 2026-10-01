variable "network_name" {
  description = "Name of the private network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the private subnet"
  type        = string
}

variable "subnet_range" {
  description = "CIDR range of the private subnet"
  type        = string
}

variable "gateway_ip" {
  description = "Gateway IP for the private subnet"
  type        = string
}

variable "subnet_allocation_pool_start" {
  description = "Start of the allocation pool"
  type        = string
}

variable "subnet_allocation_pool_end" {
  description = "End of the allocation pool"
  type        = string
}

variable "dns_nameservers" {
  description = "The DNS nameservers for the subnet"
  type        = list(string)
  default     = ["8.8.8.8", "8.8.4.4"]
}

variable "is_external" {
  description = "Whether the network is external or not"
  type        = bool
  default     = false
}

variable "is_shared" {
  description = "Whether the network is shared or not"
  type        = bool
  default     = false
}

variable "is_dhcp_enabled" {
  description = "Whether DHCP is enabled on the subnet"
  type        = bool
  default     = true
}
