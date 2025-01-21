# Région AWS
variable "region" {
    type = string
    default = "eu-west-3" 
    }

# Instance EC2
variable "instance_name" {
    type = string
    default = "instance_001" 
    }
variable "instance_count" {
    type = number
    default = 3  
    }
variable "instance_type" {
    type = string
    default = "t2.micro" 
    }
variable "instance_AMI" {
    type = string
    default = "ami-06e02ae7bdac6b938"
}

# Nom du bucket S3
variable "bucket_name" {
    type = string
    default = "bucket_001" 
    }

# Role
variable "role_name" {
    type = string
    default = "role_name"
}

variable "role_policy_name" {
    type = string
    default = "role_policy"
  
}