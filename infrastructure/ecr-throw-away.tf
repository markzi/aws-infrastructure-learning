resource "aws_ecr_repository" "main" {
  name                 = "spring-boot-cloud-deployment-learning"
  image_tag_mutability = "MUTABLE"
}