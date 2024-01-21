
variable "users" {
  type = map(object({
    name = string
    devuser = bool
    
  }))
  default = {
    devuser = {
      name = "devuser"
      devuser="1"
      
    }
    qauser =  {
      name = "qauser" 
      devuser = "0"
      
    }
  }
}