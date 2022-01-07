# AWS EC2-VPC Security Group Terraform module


## **Features**

Terraform module which creates "VPC,EC2,security group" resources on AWS.



## **Usage**

```
module "module1" {
    source = "swamirajp7/terraform-aws-EC2-VPC"
    
    instance_type = "t2.micro"
    ami = "ami-052cef05d01020f1d"
    aws_key = "sam-key"
    vpc_cidr = "10.0.0.0/16"
    subnets_cidr = "10.0.1.0/24"
    user_data_script = <<EOF
      #!/bin/sh  
      sudo yum update -y
      sudo yum install httpd -y
      sudo systemctl start httpd
      sudo echo "This is website" > /var/www/html/index.html
      chmod 777 /var/www/html/index.html
      EOF
}

```

## **Inputs**

| Name	  | Description |
| ------------- | ------------- |
| instance_type  | The type of instance to start  |
| vpc_cidr  | The CIDR block for the VPC.  |
| azs | A list of availability zones names or ids in the region |
| ami | ID of AMI to use for the instance |
| aws_key | Key name of the Key Pair to use for the instance |
| subnets_cidr | Thr CIDR block for the subnet |
| user_data_script | The user data to provide when launching the instance. |


