variable "firewall_rules" {
  description = "List of firewall rules to add to the policy"
  type = list(object({
    name             = string
    description      = string
    action           = string
    protocol         = string
    destination_port = string
    enabled          = bool
  }))
}

variable "firewall_policy_name" {
  description = "Name of the firewall policy"
  type        = string
}

variable "project_id" {
  description = "Project ID that owns the firewall policy"
  type        = string
}
