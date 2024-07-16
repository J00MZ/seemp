variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  default     = "hello-world-jxs"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "hello-world-jxs-cluster"
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  default     = "hello-world-jxs-service"
}
variable "ecs_task_definition_family" {
  description = "The family of the ECS task definition"
  default     = "hello-world-jxs-td"
}
