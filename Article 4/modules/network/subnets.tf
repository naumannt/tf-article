data "aws_availability_zones" "available" {}

resource "aws_subnet" "gateway" {
  count = "${var.subnet_count}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.1${count.index}.0/24"
  vpc_id            = "${aws_vpc.example.id}"
  tags = "${
    map(
     "Name", "example_gateway"
    )
  }"
}
resource "aws_subnet" "application" {
  count = "${var.subnet_count}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.2${count.index}.0/24"
  vpc_id            = "${aws_vpc.example.id}"
  tags = "${
    map(
     "Name", "example_application",
     "kubernetes.io/cluster/example", "shared",
    )
  }"
}

resource "aws_subnet" "database" {
  count = "${var.subnet_count}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.3${count.index}.0/24"
  vpc_id            = "${aws_vpc.example.id}"
  
  tags = "${
    map(
     "Name", "example_database"
    )
  }"
}