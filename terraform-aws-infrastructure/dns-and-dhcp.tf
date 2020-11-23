/*
## Create private Route53 DNS zone
## Association with VPC
## Create the DNS record for database
*/

resource "aws_vpc_dhcp_options" "ctechdhcp" {
    domain_name = "${var.DnsZoneName}"
    domain_name_servers = ["AmazonProvidedDNS"]
    tags {
        Name = "CTech internal name"
    }
}
resource "aws_vpc_dhcp_options_association" "dns_resolver" {
    vpc_id = "${aws_vpc.terraformmain.id}"
    dhcp_options_id = "${aws_vpc_dhcp_options.ctechdhcp.id}"
}

/* DNS PART ZONE AND RECORDS */
resource "aws_route53_zone" "main" {
    name = "${var.DnsZoneName}"
    vpc {
    vpc_id = "${aws_vpc.terraformmain.id}"
    }
    comment = "Managed by terraform"
}
## resource "aws_route53_record" "database" {
##     zone_id = "${aws_route53_zone.main.zone_id}"
##     name = "mydatabase.${var.DnsZoneName}"
##     type = "A"
##     ttl = "300"
##     records = ["${aws_instance.database.private_ip}"]
## }
## 
