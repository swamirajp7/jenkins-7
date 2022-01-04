variable "ami" {
    default = "ami-052cef05d01020f1d"
  
}

variable "instance_type" {
    
  
}

variable "aws_key" {
    
  
}


variable "vpc_cidr" {
    default = "10.0.0.0/16"

  
}

variable "subnets_cidr" {
    default = "10.0.1.0/24"
  
}

variable "azs" {
	default = "ap-south-1a"
}

variable "user_data_script" {
  
}