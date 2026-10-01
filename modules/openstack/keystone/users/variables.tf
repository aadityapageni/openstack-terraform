variable "user_names" {
  description = "List of user names to create"
  type        = list(string)
}

variable "user_passwords" {
  description = "Map of user names to passwords"
  type        = map(string)
  sensitive   = true
}

variable "project_id" {
  description = "Project ID where users will be assigned"
  type        = string
}

variable "role_id" {
  description = "Role ID to assign to users"
  type        = string
}
