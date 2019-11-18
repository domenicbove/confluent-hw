resource "aws_security_group" "bastion" {
  name        = "bastion"
  # vpc_id      = "${aws_vpc.vpc.id}"
  vpc_id = "${var.vpc_id}"

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

  # 9021 (control center)
  ingress {
    from_port   = "9021"
    to_port     = "9021"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # 8088/tcp (ksql)
  ingress {
    from_port   = "8088"
    to_port     = "8088"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  # 9092/tcp (kafka)
  ingress {
    from_port   = "9092"
    to_port     = "9092"
    protocol    = "tcp"
    self        = true
    #cidr_blocks = ["0.0.0.0/0"]
  }

  # 9091/tcp (kafka)
  ingress {
    from_port   = "9091"
    to_port     = "9091"
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

  # 8083/tcp (connect cluster)
  ingress {
    from_port   = "8083"
    to_port     = "8083"
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
