variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "description" {
  description = "Description of the security group"
  type        = string
  default     = "Security group managed by Terraform"
}

variable "rules" {
  description = "List of security group rules"
  type = list(object({
    name      = string
    protocol  = string
    port_min  = number
    port_max  = number
    remote_ip = string
  }))

  default = [
    { name = "SSH", protocol = "tcp", port_min = 22, port_max = 22, remote_ip = "0.0.0.0/0" },
    { name = "HTTP", protocol = "tcp", port_min = 80, port_max = 80, remote_ip = "0.0.0.0/0" },
    { name = "HTTPS", protocol = "tcp", port_min = 443, port_max = 443, remote_ip = "0.0.0.0/0" },
    { name = "ICMP", protocol = "icmp", port_min = 0, port_max = 0, remote_ip = "0.0.0.0/0" }
  ]
}
