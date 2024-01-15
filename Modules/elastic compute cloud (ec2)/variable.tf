variable "ami" {
    default = "ami-03f4878755434977f"
  
}

variable "key_name" {
    default = "terraform"
}

variable "instance_type" {
    type = string
}

variable "user_data" { default = "" }