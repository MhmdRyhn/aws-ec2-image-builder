# AWS EC2 Image Builder
Build an AWS EC2 AMI using Hashicorp's Packer. When an instance is launched using this AMI and then accessed the public 
IP (make sure port 80 is open in the security group attached to the instance), then a message is got (*The apache2 
server has been set up in this instance's AMI using Hashicorp's Packer.*). 

## Packer Version Info
Here, **Packer 1.6.6** has been used. Packer version earlier than `1.5` doesn't support **HCL2** syntax, JSON is used 
in those cases instead.

## Input
Create a file named `variables.pkrvars.hcl` and put the following content in the file. Here is a sample input.
```text
profile = "dev"
region = "eu-west-1"
prefix = "app-name"
environment = "dev"
base_ami = "ami-0dc8d444ee2a42d8a"
instance_type = "t2.micro"
```

## Create AMI
To create the AMI, run the `build.sh` script. Make sure, the script has the **executable** permission.
```shell script
sudo chmod +x build.sh
./build.sh
``` 
