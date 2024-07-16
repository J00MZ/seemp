# Retrieve the latest ECS-optimized AMI ID
data "aws_ssm_parameter" "ecs_optimized_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
}

resource "aws_instance" "ecs_instance" {
  ami             = data.aws_ssm_parameter.ecs_optimized_ami.value
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.allow_http.id]

  user_data = <<-EOF
               #!/bin/bash
               echo ECS_CLUSTER=${aws_ecs_cluster.hello_world.name} >> /etc/ecs/ecs.config
             EOF
  lifecycle {
    ignore_changes = [security_groups]
  }
  tags = {
    Name = "ecs-instance-jxs"
  }
}
