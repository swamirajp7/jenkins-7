terraform {
  required_version = ">=0.12"
}
resource "aws_security_group" "sg1" {
    vpc_id = aws_vpc.terra_vpc.id
    name = "security_group_sg1"
    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"

    }
    ingress {
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"

    }
    
    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

  
}

resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type
    security_groups = [aws_security_group.sg1.id]
    key_name = var.aws_key
    subnet_id = aws_subnet.sub-pub1.id
    user_data = var.user_data_script

    
}

resource "aws_vpc" "terra_vpc" {
    cidr_block = var.vpc_cidr
    tags = {
      "Name" = "vpc"
    }

  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.terra_vpc.id
    tags = {
      "Name" = "main"
    }
  
}

resource "aws_subnet" "sub-pub1" {
    vpc_id = aws_vpc.terra_vpc.id
    cidr_block = var.subnets_cidr
    availability_zone = var.azs
    map_public_ip_on_launch = true

  
}



resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "publicRouteTable"
  }
}


resource "aws_route_table_association" "a" {
    subnet_id = aws_subnet.sub-pub1.id
    route_table_id = aws_route_table.public_rt.id

  
}

