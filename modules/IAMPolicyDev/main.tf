provider "aws" {
  region = "ap-south-1"
}

data "aws_iam_policy_document" "devPolicyDoc" {
  statement {
    effect = "Deny"
    actions = [ "elasticbeanstalk:CreateEnvironment",
                "elasticbeanstalk:RebuildEnvironment",
                "elasticbeanstalk:TerminateEnvironment"
            ]
        resources = [ "*" ]
  }

  statement {
    effect = "Allow"
    actions = [ "ec2:RunInstances" ]
    resources = [ 
        "arn:aws:ec2:ap-south-1:532663929782:instance/*",
        "arn:aws:ec2:ap-south-1:532663929782:subnet/subnet-0ba82347"
     ]
     condition {
       test = "StringEquals"
       variable = "ec2:InstanceType"
       values = [ "t2.micro" ]
     }
  }
}

resource "aws_iam_policy" "dev" {
  name = "DevPolicy"
  path = "/"
  policy = data.aws_iam_policy_document.devPolicyDoc.json
}