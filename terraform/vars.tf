## Put below variables into terraform.tfvars file, which is in gitignore
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "us-west-1"
}
## us-west-1 centos ami
variable "centos_ami" {
  default = "ami-074e2d6769f445be5"
}
# us-west-1 rhel7.6 ami "ami-056efb42b219f9abb"
# us-west-1 rhel7.7
variable "ami" {
  default = "ami-0388d197bb42be9be"
}
# variable "ubuntu_ami" {
#   default = "ami-0ab6b07a01e922253"
# }

variable "vpc_id" {
  default = "vpc-fc27e099"
}

variable "ec2_type_node" {
  default = "t2.xlarge"
}
#t2.medium
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
