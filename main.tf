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
  count  = length(var.users)
  name = var.users[count.index].name
  devuser = var.users[count.index].devuser
  
  
}

