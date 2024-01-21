
variable "users" {
  type = map(object({
    name = string
    devuser = bool
    qauser = bool
    
  }))
  default = {
    devuser = {
      name = "devuser"
      devuser="1"
      qauser="0"
      
    }
    qauser =  {
      name = "qauser" 
      devuser = "0"
      qauser="1"
      
    }
  }
}