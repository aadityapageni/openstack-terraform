variable "firewall_rules" {
  description = "List of firewall rules to create"
  type = list(object({
    name             = string
    description      = string
    action           = string
    protocol         = string
    destination_port = string
    enabled          = bool
  }))
}
