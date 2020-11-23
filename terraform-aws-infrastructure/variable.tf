variable "region" {
    default = "us-east-1"
}
variable "profile" {
    default = "ctadmin"
}
variable "account_id" {
    default = "813865220356"
}
variable "AmiLinux" {
type = "map"
    default = {
    us-east-1 = "ami-xxxxxxxxxxxxx"
    us-east-2 = "ami-yyyyyyyyyyyyy"
    }
}
variable "aws_access_key" {
    default = ""
    description = "user aws access key"
}
variable "aws_secret_key" {
    default = ""
    description = " user aws secret key"
}
variable "vpc-fullcidr" {
    default = "172.16.0.0/16"
    description = "the vpc cdir using terraform"
}
variable "Subnet-Public-01-CIDR" {
    default = "172.16.0.0/24"
    description = "the cidr of the public subnet 01"
}
variable "Subnet-Private-01-CIDR" {
    default = "172.16.3.0/24"
    description = "the cidr of the private subnet 01"
}
variable "Subnet-Private-02-CIDR" {
    default = "172.16.4.0/24"
    description = "the cidr of the private subnet 02"
}
variable "key_name" {
    default = "ctadminkey"
    description = "the ssh key to use in the EC2 machines"
}
variable "DnsZoneName" {
     default = "CTechAWSDNS.internal"
     description = "the internal dns name"
}
