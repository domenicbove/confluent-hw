## Put below variables into terraform.tfvars file, which is in gitignore
variable "access_key" {}
variable "secret_key" {}
variable "dns_domain" {}
variable "region" {
  default = "us-west-2"
}
# There is a way to use a data object to query this
variable "rhel_ami" {
  default = "ami-28e07e50"
}
variable "ubuntu_ami" {
  default = "ami-0ab6b07a01e922253"
}
variable "centos_ami" {
  default = "ami-3ecc8f46"
}
variable "clusterid" {
  default = "confluent"
}
variable "ec2_type_master" {
  default = "t2.medium"
}
variable "ec2_key" {
  default = "confluent-key"
}
variable "ssh_key_public" {
  default = "~/.ssh/id_rsa.pub"
}
resource "aws_key_pair" "default" {
  key_name   = "${var.ec2_key}"
  public_key = "${file(var.ssh_key_public)}"
}
