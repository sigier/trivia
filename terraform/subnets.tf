locals {
  azs           = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

  public_cidrs  = [
    "192.168.0.0/27",
    "192.168.0.32/27",
    "192.168.0.64/27"
  ]

  private_cidrs = [
    "192.168.1.0/24",
    "192.168.2.0/24",
    "192.168.3.0/24"
  ]
}

resource "aws_subnet" "public" {
  count                   = 3
  vpc_id                  = aws_vpc.main.id
  cidr_block              = local.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = local.azs[count.index]

  tags = {
    Name = "Public-Subnet-Trivia-${count.index + 1}"
    Type = "public"
  }
}

resource "aws_subnet" "private" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.private_cidrs[count.index]
  availability_zone = local.azs[count.index]

  tags = {
    Name = "Private-Subnet-Trivia-${count.index + 1}"
    Type = "private"
  }
}

