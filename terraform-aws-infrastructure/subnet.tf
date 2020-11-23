/*
## Public Subnet 01 in AZ [0]
## Private Subnet 01 in AZ [1]
## Private Subnet 02 in AZ [1]
*/

# Public 01
resource "aws_subnet" "Public01" {
    vpc_id = "${aws_vpc.terraformmain.id}"
    cidr_block = "${var.Subnet-Public-01-CIDR}"
    tags {
        Name = "Public 01"
    }
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
}
resource "aws_route_table_association" "Public01" {
    subnet_id = "${aws_subnet.Public01.id}"
    route_table_id = "${aws_route_table.public.id}"
}

# Private 01
resource "aws_subnet" "Private01" {
    vpc_id = "${aws_vpc.terraformmain.id}"
    cidr_block = "${var.Subnet-Private-01-CIDR}"
    tags {
        Name = "Private 01"
    }
    availability_zone = "${data.aws_availability_zones.available.names[1]}"
}
resource "aws_route_table_association" "Private01" {
    subnet_id = "${aws_subnet.Private01.id}"
    route_table_id = "${aws_route_table.private.id}"
}

# Private 02
resource "aws_subnet" "Private02" {
    vpc_id = "${aws_vpc.terraformmain.id}"
    cidr_block = "${var.Subnet-Private-02-CIDR}"
    tags {
        Name = "Private 02"
    }
    availability_zone = "${data.aws_availability_zones.available.names[1]}"
}
resource "aws_route_table_association" "Private02" {
    subnet_id = "${aws_subnet.Private02.id}"
    route_table_id = "${aws_route_table.private.id}"
}
