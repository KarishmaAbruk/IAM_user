provider "aws" {
  region = var.aws_region
}

resource "aws_iam_user" "jenkins_pipeline_user" {
  name = var.iam_user_name
  tags = {
    Purpose = "JenkinsPipeline"
    CreatedBy = "Terraform"
  }
}

resource "aws_iam_user_policy_attachment" "jenkins_attach_policy" {
  user       = aws_iam_user.jenkins_pipeline_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_access_key" "jenkins_user_key" {
  user = aws_iam_user.jenkins_pipeline_user.name
}

output "access_key_id" {
  value       = aws_iam_access_key.jenkins_user_key.id
  sensitive   = true
}

output "secret_access_key" {
  value       = aws_iam_access_key.jenkins_user_key.secret
  sensitive   = true
}
