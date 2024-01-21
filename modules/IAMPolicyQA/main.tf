provider "aws" {
  region = "ap-south-1"
}

# generating policy document in JSON

data "aws_iam_policy_document" "QAPolicyDoc" {
  statement {
    effect = "Allow"
    actions = [ 
        "elasticbeanstalk:Check*",
        "elasticbeanstalk:Describe*",
        "elasticbeanstalk:List*",
        "elasticbeanstalk:RequestEnvironmentInfo",
        "elasticbeanstalk:RetrieveEnvironmentInfo",
        "ec2:Describe*",
        "elasticloadbalancing:Describe*",
        "autoscaling:Describe*",
        "cloudwatch:Describe*",
        "cloudwatch:List*",
        "cloudwatch:Get*",
        "s3:Get*",
        "s3:List*",
        "sns:Get*",
        "sns:List*",
        "rds:Describe*",
        "cloudformation:Describe*",
        "cloudformation:Get*",
        "cloudformation:List*",
        "cloudformation:Validate*",
        "cloudformation:Estimate*",
     ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "qa"{
  name = "QAPolicy"
  path = "/"
  policy = data.aws_iam_policy_document.QAPolicyDoc.json
}