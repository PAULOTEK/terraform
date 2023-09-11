resource "aws_key_pair" "key" {
  public_key = file("")
  key_name   = "aws_kay"
}
resource "aws_instance" "vm" {
  ami                         = "ami-"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet.id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  tags = {
    "Name" = "vm_terraform"
  }
}