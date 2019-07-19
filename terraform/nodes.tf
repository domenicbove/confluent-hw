resource "aws_instance" "node1" {
  ami             = "${var.ami}"
  instance_type   = "${var.ec2_type_node}"
  key_name        = "${aws_key_pair.default.key_name}"
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
  subnet_id       = "${aws_subnet.public.id}"
}

resource "aws_eip" "eip_node1" {
  instance = "${aws_instance.node1.id}"
  vpc = true
}

resource "aws_instance" "node2" {
  ami             = "${var.ami}"
  instance_type   = "${var.ec2_type_node}"
  key_name        = "${aws_key_pair.default.key_name}"
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
  subnet_id       = "${aws_subnet.public.id}"
}

resource "aws_eip" "eip_node2" {
  instance = "${aws_instance.node2.id}"
  vpc = true
}

resource "aws_instance" "node3" {
  ami             = "${var.ami}"
  instance_type   = "${var.ec2_type_node}"
  key_name        = "${aws_key_pair.default.key_name}"
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
  subnet_id       = "${aws_subnet.public.id}"
}

resource "aws_eip" "eip_node3" {
  instance = "${aws_instance.node3.id}"
  vpc = true
}

resource "aws_instance" "node4" {
  ami             = "${var.ami}"
  instance_type   = "${var.ec2_type_node}"
  key_name        = "${aws_key_pair.default.key_name}"
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
  subnet_id       = "${aws_subnet.public.id}"
}

resource "aws_eip" "eip_node4" {
  instance = "${aws_instance.node4.id}"
  vpc = true
}
