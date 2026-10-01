variable "name" {
  description = "The name of the image"
  type        = string
}

variable "image_source_url" {
  description = "The URL of the image"
  type        = string
}

variable "container_format" {
  description = "The container format of the image (bare, ami, ari, aki, ovf, ova, docker)"
  type        = string
}

variable "disk_format" {
  description = "The disk format of the image (raw, qcow2, vhd, vmdk, vdi, iso, aki, ami, ari)"
  type        = string
}

variable "visibility" {
  description = "The visibility of the image (public, private, shared, community)"
  type        = string
}

variable "properties" {
  description = "Additional properties for the image"
  type        = map(string)
  default     = {}
}
