resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "openshift bastion security group"
  vpc_id      = "${aws_vpc.vpc.id}"

  # ICMP (any)
  ingress {
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "5000"
    to_port     = "5000"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH (any)
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # 9092/tcp (kafka)
  ingress {
    from_port   = "9092"
    to_port     = "9092"
    protocol    = "tcp"
    self        = true
    #cidr_blocks = ["0.0.0.0/0"]
  }

  # 2181/tcp (zookeeper)
  ingress {
    from_port   = "2181"
    to_port     = "2181"
    protocol    = "tcp"
    self        = true
    #cidr_blocks = ["0.0.0.0/0"]
  }

  # 2888/tcp (zookeeper)
  ingress {
    from_port   = "2888"
    to_port     = "2888"
    protocol    = "tcp"
    self        = true
    #cidr_blocks = ["0.0.0.0/0"]
  }

  # 3888/tcp (zookeeper)
  ingress {
    from_port   = "3888"
    to_port     = "3888"
    protocol    = "tcp"
    self        = true
    #cidr_blocks = ["0.0.0.0/0"]
  }

  # 8081/tcp (ksql)
  ingress {
    from_port   = "8081"
    to_port     = "8081"
    protocol    = "tcp"
    self        = true
    #cidr_blocks = ["0.0.0.0/0"]
  }
  # 8088/tcp (ksql)
  ingress {
    from_port   = "8088"
    to_port     = "8088"
    protocol    = "tcp"
    self        = true
    #cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
#
# resource "aws_security_group" "node" {
#   name        = "node"
#   description = "openshift node security group"
#   vpc_id      = "${aws_vpc.vpc.id}"
#    # ICMP (any)
#   ingress {
#     from_port   = "-1"
#     to_port     = "-1"
#     protocol    = "icmp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#    # SSH (any)
#   ingress {
#     from_port   = "22"
#     to_port     = "22"
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   # 4789/udp (node)
#   ingress {
#     from_port   = "4789"
#     to_port     = "4789"
#     protocol    = "udp"
#     self        = true
#   }
#
#   # 10250/tcp (node)
#   ingress {
#     from_port   = "10250"
#     to_port     = "10250"
#     protocol    = "tcp"
#     self        = true
#   }
#
#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }
#
#   tags {
#     Name      = "Node"
#     clusterid = "${var.clusterid}"
#   }
# }
#
# resource "aws_security_group" "master" {
#   name        = "master"
#   description = "openshift master security group"
#   vpc_id      = "${aws_vpc.vpc.id}"
#
#   # 53/tcp (master, node)
#   ingress {
#     from_port   = "53"
#     to_port     = "53"
#     protocol    = "tcp"
#     self        = true
#     security_groups = ["${aws_security_group.node.id}"]
#   }
#
#   # 53/udp (master, node)
#   ingress {
#     from_port   = "53"
#     to_port     = "53"
#     protocol    = "udp"
#     self        = true
#     security_groups = ["${aws_security_group.node.id}"]
#   }
#
#   # 2379/tcp (master)
#   ingress {
#     from_port   = "2379"
#     to_port     = "2379"
#     protocol    = "tcp"
#     self        = true
#   }
#
#   # 2380/tcp (master)
#   ingress {
#     from_port   = "2380"
#     to_port     = "2380"
#     protocol    = "tcp"
#     self        = true
#   }
#
#   # 8053/tcp (master, node)
#   ingress {
#     from_port   = "8053"
#     to_port     = "8053"
#     protocol    = "tcp"
#     self        = true
#     security_groups = ["${aws_security_group.node.id}"]
#   }
#
#   # 8053/udp (master, node)
#   ingress {
#     from_port   = "8053"
#     to_port     = "8053"
#     protocol    = "udp"
#     security_groups = ["${aws_security_group.node.id}"]
#     self = true
#   }
#
#   # 9090/tcp (any)
#   ingress {
#     from_port   = "9090"
#     to_port     = "9090"
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   # 443/tcp (any)
#   ingress {
#     from_port   = "8443"
#     to_port     = "8443"
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }
#
#   tags {
#     Name      = "Master"
#     clusterid = "${var.clusterid}"
#   }
# }
#
# resource "aws_security_group" "infra" {
#   name        = "infra"
#   description = "openshift infra security group"
#   vpc_id      = "${aws_vpc.vpc.id}"
#    # 80/tcp (any)
#   ingress {
#     from_port   = "80"
#     to_port     = "80"
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#    # 443/tcp (any)
#   ingress {
#     from_port   = "443"
#     to_port     = "443"
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   # 9200/tcp (any)
#   ingress {
#     from_port   = "9200"
#     to_port     = "9200"
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   # 9300/tcp (any)
#   ingress {
#     from_port   = "9300"
#     to_port     = "9300"
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }
#
#   tags {
#     Name      = "Infra"
#     clusterid = "${var.clusterid}"
#   }
# }
