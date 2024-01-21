#DEV USER CREATION

#module "iam_dev_user" {
#  source  = "./modules/IAMUsers"
#  devuser = "1"
#  name    = "devuser"
#}


# QA USER CREATION

module "iam_qa_user" {
  source = "./modules/IAMUsers"
  qauser = "1"
  name    = "testuser"
}

# TryOuts below

module "users" {
  source = "./modules/IAMUsers"
  for_each = var.users
  qauser= each.value.qauser
  devuser=each.value.devuser
  name=each.value.name

}

