resource "aws_subnet" "public" {
  # vpc_id     = "${aws_vpc.vpc.id}"
  vpc_id = "${var.vpc_id}"
  cidr_block = "172.16.0.0/24"
  availability_zone = "${data.aws_availability_zones.azs.names[0]}"
}

resource "aws_route_table" "routetable" {
  # vpc_id = "${aws_vpc.vpc.id}"
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}

resource "aws_route_table_association" "public_routetable" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.routetable.id}"
}
