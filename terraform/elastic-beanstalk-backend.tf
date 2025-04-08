
resource "aws_elastic_beanstalk_application" "backend" {
  name        = "trivia-backend-app"
  description = "Elastic Beanstalk app for Trivia Express.js backend"
}

resource "aws_elastic_beanstalk_environment" "backend_env" {
  name                = "trivia-backend-app-env"
  application         = aws_elastic_beanstalk_application.backend.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.5.0 running Docker"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "elastic-beanstalk-instance-profile"  
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "MONGODB_URI"
    value     = var.mongodb_uri
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t3.medium"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "2"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "3"
  }
}