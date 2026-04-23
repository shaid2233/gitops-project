resource "aws_ecr_repository" "example" {
  name = "my-repository"
}

output "ecr_repository_url" {
  value = aws_ecr_repository.example.repository_url
}