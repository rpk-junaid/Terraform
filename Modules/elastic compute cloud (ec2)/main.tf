resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "terraform_key" {
    key_name = var.key_name
    public_key = tls_private_key.pk.public_key_openssh #Replace it with the key material
    provisioner "local-exec" { # download to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./terraform.pem"
  }

}

resource "aws_instance" "terraform" {
   ami = var.ami
   instance_type = var.instance_type
   associate_public_ip_address = true
   key_name = aws_key_pair.terraform_key.key_name
   user_data = var.user_data
  
}