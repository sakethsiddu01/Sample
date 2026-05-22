# 1. This automatically grabs the latest official Ubuntu 24.04 image ID
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical's official AWS owner ID
}

# 2. This provisions a free-tier eligible EC2 virtual machine
resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro" 

  tags = {
    Name        = "Saketh-DevOps-Instance"
    Environment = "Dev"
    ManagedBy   = "GitHub-Actions"
  }
}
