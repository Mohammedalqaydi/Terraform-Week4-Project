resource "alicloud_ecs_key_pair" "nginx" {
  key_pair_name = "nginx"
  key_file      = "key.pem"
}