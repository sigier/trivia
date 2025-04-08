variable "aws_region" {
  description = "AWS Region"  
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "mongodb_uri" {
  description = "MongoDB connection URI used by the backend Elastic Beanstalk app"
  type        = string
}