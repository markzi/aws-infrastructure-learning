terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = local.aws_region
}

resource "aws_key_pair" "ecs" {
  key_name   = "ecs-key-${var.environment}"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtMljjj0Ccxux5Mssqraa/iHHxheW+m0Rh17fbd8t365y9EwBn00DN/0PjdU2CK6bjxwy8BNGXWoUXiSDDtGqRupH6e9J012yE5kxhpXnnkIcLGjkAiflDBVV4sXS4b3a2LSXL5Dyb93N2GdnJ03FJM4qDJ8lfDQxb38eYHytZkmxW14xLoyW5Hbyr3SXhdHC2/ecdp5nLNRwRWiW6g9OA6jTQ3LgeOZoM6dK4ltJUQOakKjiHsE+jvmO0hJYQN7+5gYOw0HHsM+zmATvSipAWzoWBWcmBxAbcdW0R0KvCwjylCyRVbRMRbSZ/c4idZbFLZXRb7ZJkqNJuy99+ld41 ecs@aws.fake"
}
