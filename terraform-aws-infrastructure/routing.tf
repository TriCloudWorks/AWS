/*
## attach an internet gateway to the VPC
## define a network ACL
## define two routing tables: one for public access, and the other one for private access
*/

# Declare the data source
data "aws_availability_zones" "available" {}
/* EXTERNAL NETWORK , IG, ROUTE TABLE */

## Internet Gateway for VPC
resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.terraformmain.id}"
    tags {
        Name = "internet gateway terraform generated"
    }
}

## ACL for VPC
resource "aws_network_acl" "all" {
    vpc_id = "${aws_vpc.terraformmain.id}"
    egress {
        protocol = "-1"
        rule_no = 2
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    ingress {
         protocol = "-1"
         rule_no = 1
         action = "allow"
         cidr_block = "0.0.0.0/0"
         from_port = 0
         to_port = 0
    }
    tags {
         Name = "open acl terraform generated"
    }
}

## Route Table - Public
resource "aws_route_table" "public" {
    vpc_id = "${aws_vpc.terraformmain.id}"
    tags {
        Name = "Public route table"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}
## Route Table - Private
resource "aws_route_table" "private" {
    vpc_id = "${aws_vpc.terraformmain.id}"
    tags {
       Name = "Private route table"
    }
route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.Public01.id}"
    }
}

## EIP for NAT to Internet Gateway
resource "aws_eip" "forNat" {
    vpc = true
}
    resource "aws_nat_gateway" "Public01" {
    allocation_id = "${aws_eip.forNat.id}"
    subnet_id = "${aws_subnet.Public01.id}"
   depends_on = ["aws_internet_gateway.gw"]
}

