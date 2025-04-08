resource "aws_iam_role" "elastic_beanstalk_role" {
  name               = "elastic-beanstalk-instance-profile"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Attach the necessary policies to the role
resource "aws_iam_role_policy_attachment" "elastic_beanstalk_policy" {
  role       = aws_iam_role.elastic_beanstalk_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "cloudwatch_policy" {
  role       = aws_iam_role.elastic_beanstalk_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}
