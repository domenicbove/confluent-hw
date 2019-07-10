resource "aws_route_table" "routetable" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}

resource "aws_route_table_association" "public_routetable" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.routetable.id}"
}
