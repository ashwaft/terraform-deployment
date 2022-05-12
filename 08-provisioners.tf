resource "null_resource" "mars_null_resource" {
  depends_on = [
     aws_instance.mars_bastion
   ]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = aws_instance.mars_bastion.public_ip
    private_key = file("private-key/mars-key.pem")
  } 

  provisioner "file" {
    source = "private-key/mars-key.pem"
    destination = "/tmp/mars-key.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/mars-key.pem",
    ]
  }
}