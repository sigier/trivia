
resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/22"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "trivia"
  }
}