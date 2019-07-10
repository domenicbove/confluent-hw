resource "aws_instance" "node1" {
  ami             = "${var.centos_ami}"
  instance_type   = "${var.ec2_type_master}"
  key_name        = "${aws_key_pair.default.key_name}"
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
  subnet_id       = "${aws_subnet.public.id}"

  # root_block_device {
  #   delete_on_termination = true
  #   volume_size = 50
  # }
}

resource "aws_eip" "eip-node1" {
  vpc = true
}

resource "aws_eip_association" "eip_node1_assoc" {
  instance_id   = "${aws_instance.node1.id}"
  allocation_id = "${aws_eip.eip-node1.id}"
}

resource "aws_instance" "node2" {
  ami             = "${var.centos_ami}"
  instance_type   = "${var.ec2_type_master}"
  key_name        = "${aws_key_pair.default.key_name}"
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
  subnet_id       = "${aws_subnet.public.id}"

  # root_block_device {
  #   delete_on_termination = true
  #   volume_size = 50
  # }
}

resource "aws_eip" "eip-node2" {
  vpc = true
}

resource "aws_eip_association" "eip_node2_assoc" {
  instance_id   = "${aws_instance.node2.id}"
  allocation_id = "${aws_eip.eip-node2.id}"
}


resource "aws_instance" "node3" {
  ami             = "${var.centos_ami}"
  instance_type   = "${var.ec2_type_master}"
  key_name        = "${aws_key_pair.default.key_name}"
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
  subnet_id       = "${aws_subnet.public.id}"

  # root_block_device {
  #   delete_on_termination = true
  #   volume_size = 50
  # }
}

resource "aws_eip" "eip-node3" {
  vpc = true
}

resource "aws_eip_association" "eip_node3_assoc" {
  instance_id   = "${aws_instance.node3.id}"
  allocation_id = "${aws_eip.eip-node3.id}"
}
