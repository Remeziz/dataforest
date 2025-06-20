data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    bucket = "some-bucket"
    key    = "infra.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "frontend" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"
  subnet_id     = data.terraform_remote_state.infra.outputs.public_subnets[1]
  vpc_security_group_ids = [
    data.terraform_remote_state.infra.outputs.frontend_sg_id
  ]

  user_data = file("${path.module}/scripts/user_data.sh")

  tags = {
    Name = "frontend-instance"
  }
}
