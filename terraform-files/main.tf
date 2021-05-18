terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Configure the AWS instance
resource "aws_instance" "challenge" {
  count         = 1
  ami           = var.amis.us-east-1
  instance_type = "t2.micro"
  key_name      = var.key_name
  //  subnet_id              = aws_subnet.challenge-subnet.id
  vpc_security_group_ids      = [aws_security_group.challenge-sg.id]
  associate_public_ip_address = true
  user_data                   = data.template_file.launch.template
  tags = {
    Name = "challenge${count.index}"
  }
}

data "template_file" "launch" {
  template = <<EOF
#!/bin/bash
sudo apt-get update

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce
sudo usermod -aG docker $(whoami)

git clone https://github.com/joao-dore/challenge-ia.git
sudo mv challenge-ia/ /home/ubuntu/
cd /home/ubuntu/challenge-ia/

sudo apt install swarm
sudo docker swarm init
sudo docker stack deploy -c docker-compose.yml challenge

EOF
}