provider "aws" {
  region = "ap-south-1"
}

#importing IAM Policy  

module "IamPolicyDev" {
  source = "../IAMPolicyDev"
}

module "IamPolicyQA" {
  source = "../IAMPolicyQA"
}

# creating IAM User

resource "aws_iam_user" "User" {
  name = var.name
  path = var.path
  force_destroy = var.force_destroy
  tags = {
    "test_user" = var.name
  }
}

# Creating IAM access Key

resource "aws_iam_access_key" "Key" {
  user = aws_iam_user.User.name
}

# Attaching policy to user

resource "aws_iam_user_policy" "Policy" {
  user=aws_iam_user.User.name
  policy = var.devuser? module.IAMPolicyDev.policy : module.IAMPolicyQA.policy 
}