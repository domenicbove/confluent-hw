resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "172.16.0.0/24"
  availability_zone = "${data.aws_availability_zones.azs.names[0]}"
}
