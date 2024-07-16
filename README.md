# Seemp-X

Solution to [Exercise](docs/Exercise.pdf)

## Create Infra

### Prerequisites

- AWS Credentials exported as environment variables
- [OpenTofu](https://opentofu.org/docs/intro/install/) installed

```shell
export AWS_ACCESS_KEY_ID=your-access-key-id
export AWS_SECRET_ACCESS_KEY=your-secret-access-key
cd infra
tofu init
tofu apply
```

## Setup

- VPC: two subnets one public one private (No internet gateway attached)
- Security Groups: 
  - Public: SG allows HTTP on port 80
  - Private: No SG created since no access required by exercise
- ECS:
  - Running on the EC2 instance deployed in the public subnet
- CI/CD - Github Actions
  - On push to master branch, builds the [app](app/Dockerfile) Docker container
  - Pushes the updated container to ECR.
  - Deploys the new build to ECS, which runs on the EC2 instance in the public subnet.
- Security:
  - Utilizes Github Secrets: for `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION` and `AWS_ACCOUNT_ID`

## Network Diagram

![Network Diagram](docs/network-diagram.png)

## Cleanup

```shell
cd infra
tofu destroy
```
