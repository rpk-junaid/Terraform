resource "aws_key_pair" "terraform_key" {
    key_name = var.key_name
    public_key = file("~/.ssh/id_rsa.pub") #Replace it with the key material

}
resource "local_file" "private_key" {
    depends_on = [ aws_key_pair.terraform_key ]
    content = aws_key_pair.terraform_key.private_key_pem
    filename = "~/Downloads/terraform_key.pem"
}

resource "aws_instance" "terraform" {
   ami = var.ami
   instance_type = var.instance_type
   associate_public_ip_address = true
   key_name = aws_key_pair.terraform_key.key_name
  
}