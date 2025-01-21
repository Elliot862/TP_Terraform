
#NETWORK
resource "aws_vpc" "main_vpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "main_vpc"
  }
}

resource "aws_subnet" "subnetwork" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnetwork_01"
  }
}

resource "aws_internet_gateway" "gateway" {
    vpc_id = aws_vpc.main_vpc.id

    tags = {
        Name = "main_gateway"
  }
}



resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "main_route"
  }
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.subnetwork.id
  route_table_id = aws_route_table.route_table.id
}

# bucket s3
resource "aws_s3_bucket" "s3_bucket" {
    bucket = var.bucket_name
}

# Groupe de sécurité
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}


# instance ec2
resource "aws_instance" "ec2_instance"{
    count = var.instance_count
    instance_type = var.instance_type
    ami = var.instance_AMI
    subnet_id = aws_subnet.subnetwork.id
    tags = {"name"=var.instance_name}
}

resource "aws_eip" "elastic_ip" {
    count = var.instance_count
    vpc = true
    tags = {
        Name = "elastic_ip-${count.index + 1}"
  }
}

resource "aws_eip_association" "eip_assoc" {
    count = var.instance_count
    instance_id   = aws_instance.ec2_instance[count.index].id
    allocation_id = aws_eip.elastic_ip[count.index].id
}


#Roles
resource "aws_iam_role" "iam_role" {
    name = var.role_name
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "role_policy" {
  name = var.role_policy_name
  role = aws_iam_role.iam_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Effect = "Allow"
        Resource = [
          aws_s3_bucket.s3_bucket.arn,
          "${aws_s3_bucket.s3_bucket.arn}/*"
        ]
      }
    ]
  })
}

