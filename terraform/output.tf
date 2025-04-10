output "eb_application_name" {
  description = "Elastic Beanstalk application name"
  value       = aws_elastic_beanstalk_application.backend.name
}

output "eb_environment_name" {
  description = "Elastic Beanstalk environment name"
  value       = aws_elastic_beanstalk_environment.backend_env.name
}



output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.frontend.id
}