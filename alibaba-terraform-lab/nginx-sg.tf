resource "alicloud_security_group" "nginx" {
  name        = "nginx"
  description = "nginx security group"
  vpc_id      = alicloud_vpc.myvpc.id
}


resource "alicloud_security_group_rule" "http" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "80/80"
  priority          = 1
  security_group_id = alicloud_security_group.nginx.id
  cidr_ip           = "0.0.0.0/0"
}
resource "alicloud_security_group_rule" "ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.nginx.id
  cidr_ip           = "0.0.0.0/0"
}
