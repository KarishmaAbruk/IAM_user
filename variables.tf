variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "iam_user_name" {
  description = "IAM username for Jenkins pipeline"
  type        = string
  default     = "jenkins-pipeline-user"
}
