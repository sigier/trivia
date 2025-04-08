resource "aws_iam_instance_profile" "elastic_beanstalk_instance_profile" {
  name = "elastic-beanstalk-instance-profile"
  role = aws_iam_role.elastic_beanstalk_role.name
}