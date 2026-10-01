resource "openstack_images_image_access_v2" "this" {
  image_id  = var.image_id
  member_id = var.member_id
}
