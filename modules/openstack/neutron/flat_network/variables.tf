variable "network_name" {
  description = "Name of the network"
  type        = string
  default     = "flat-net"
}

variable "provider_physical_network" {
  description = "Provider physical network"
  type        = string
  default     = "physnet1"
}

variable "network_type" {
  description = "Physical network type (flat, vlan, vxlan, gre)"
  type        = string
  default     = "flat"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "flat-subnet"
}

variable "subnet_range" {
  description = "CIDR range of the subnet"
  type        = string
  default     = "10.20.30.0/24"
}

variable "gateway_ip" {
  description = "Gateway IP for the subnet"
  type        = string
  default     = "10.20.30.1"
}

variable "subnet_allocation_pool_start" {
  description = "Start of the allocation pool"
  type        = string
  default     = "10.20.30.25"
}

variable "subnet_allocation_pool_end" {
  description = "End of the allocation pool"
  type        = string
  default     = "10.20.30.27"
}

variable "dns_nameservers" {
  description = "The DNS nameservers for the subnet"
  type        = list(string)
  default     = ["8.8.8.8", "8.8.4.4"]
}

variable "is_external" {
  description = "Whether the network is external or not"
  type        = bool
  default     = true
}

variable "is_shared" {
  description = "Whether the network is shared or not"
  type        = bool
  default     = true
}

variable "is_dhcp_enabled" {
  description = "Whether DHCP is enabled on the subnet"
  type        = bool
  default     = true
}
