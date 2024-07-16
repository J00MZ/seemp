resource "aws_ecs_cluster" "hello_world" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "hello_world" {
  family                   = var.ecs_task_definition_family
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = "hello-world-jxs"
    image     = "${aws_ecr_repository.hello_world.repository_url}:latest"
    essential = true
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}


resource "aws_ecs_service" "hello_world" {
  name            = "hello-world-jxs-service"
  cluster         = aws_ecs_cluster.hello_world.id
  task_definition = aws_ecs_task_definition.hello_world.arn
  desired_count   = 1
  launch_type     = "EC2"
}

