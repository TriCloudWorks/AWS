/*
## Create an EC2 instance in public Subnet
## Master Kubernetes Node
*/

resource "aws_instance" "master" {
  ami = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.medium"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.Public01.id}"
  vpc_security_group_ids = ["${aws_security_group.WebApp.id}"]
  key_name = "${var.key_name}"
  tags {
        Name = "Master K8s - CTech Terraform VPC"
        Owner = "aravindT"
  }
}
/*
## Create an EC2 instance in private Subnet
## Worker01 Kubernetes Node
*/

resource "aws_instance" "worker01" {
  ami = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.medium"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.Private01.id}"
  vpc_security_group_ids = ["${aws_security_group.WebApp.id}"]
  key_name = "${var.key_name}"
  tags {
        Name = "Worker01 K8s - CTech Terraform VPC"
        Owner = "aravindT"
  }
}
/*
## Create an EC2 instance in private Subnet
## Worker02 Kubernetes Node
*/

resource "aws_instance" "worker02" {
  ami = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.medium"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.Private02.id}"
  vpc_security_group_ids = ["${aws_security_group.WebApp.id}"]
  key_name = "${var.key_name}"
  tags {
        Name = "Worker02 K8s - CTech Terraform VPC"
        Owner = "aravindT"
  }
}

