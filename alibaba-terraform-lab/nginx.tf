
resource "alicloud_instance" "nginx" {
  availability_zone = data.alicloud_zones.availability_zones.zones.0.id
  security_groups   = [alicloud_security_group.nginx.id]


  instance_type              = "ecs.g6.large"
  system_disk_category       = "cloud_essd"
  system_disk_size           = 40
  image_id                   = "ubuntu_24_04_x64_20G_alibase_20240812.vhd"
  instance_name              = "nginx"
  vswitch_id                 = alicloud_vswitch.public.id
  internet_max_bandwidth_out = 100
  instance_charge_type       = "PostPaid"
  internet_charge_type       = "PayByTraffic"
  key_name                   = alicloud_ecs_key_pair.nginx.key_pair_name
  user_data = base64encode(file("setup-nginx.sh"))

}
