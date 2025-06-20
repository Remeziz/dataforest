data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    bucket = "some-bucket"
    key    = "infra.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "backend" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"
  subnet_id     = data.terraform_remote_state.infra.outputs.public_subnets[0]
  vpc_security_group_ids = [
    data.terraform_remote_state.infra.outputs.backend_sg_id
  ]
  iam_instance_profile = data.terraform_remote_state.infra.outputs.backend_instance_profile_name

  user_data = templatefile("${path.module}/template/user_data.tpl", local.backend_env) 

  tags = {
    Name = "backend-instance"
  }
}
