#AWS EC2-VPC Security Group Terraform module


##**Features**

Terraform module which creates "VPC,EC2,security group" resources on AWS.






##**Usage**

```
module "module1" {
    source = "swamirajp7/terraform-aws-EC2-VPC"
    
    instance_type = "t2.micro"
    ami = "ami-052cef05d01020f1d"

    vpc_cidr = "10.0.1.0/24"
    subnets_cidr = "10.0.1.0/24"
    user_data_script = <<EOF
      #!/bin/sh  
      sudo amazon-linux-extras install docker
      sudo service docker start
      sudo mkdir /sp
      sudo echo "This is website" > /sp/index.html
      sudo echo -e "FROM centos\nRUN yum install httpd -y\nCOPY index.html /var/www/html\nCMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]\nEXPOSE 80" > /sp/dockerfile
      sudo docker build -t sam /sp/
      sudo docker run -itd -p80:80 sam bash 
      EOF
}

```

