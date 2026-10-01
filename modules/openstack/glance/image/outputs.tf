output "image_id" {
  value = openstack_images_image_v2.this.id
}

output "image_name" {
  value = openstack_images_image_v2.this.name
}

output "image_status" {
  value = openstack_images_image_v2.this.status
}
