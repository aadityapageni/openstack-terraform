resource "openstack_images_image_v2" "this" {
  name             = var.name
  image_source_url = var.image_source_url
  container_format = var.container_format
  disk_format      = var.disk_format
  visibility       = var.visibility
  properties       = var.properties
}
