resource "aws_instance" "ssh-ec2" {
  ami           ="ami-2757f631"
  instance_type = "t2.micro"
    key_name= "aws_key"
    subnet_id = "${aws_subnet.subnet.id}"
    vpc_security_group_ids = [aws_security_group.ssh.id]

provisioner "file" {
    source      = "/home/knoldus/Downloads/spring-boot-example-main/target/hello-0.0.1-SNAPSHOT.jar"
    destination = "/home/ubuntu/file.jar"
} 
connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("/home/knoldus/Downloads/aws_key.pem")
}

provisioner "remote-exec" {
  inline = [
    "sudo apt-get update",
    "sudo apt-get install openjdk-8-jdk -y",
    "sudo java -jar file.jar",
  ]
}

  tags = {
    Name = "Instance-provisioner"
  }
}

resource "aws_security_group" "ssh" {
  vpc_id = "${aws_vpc.vpc.id}"
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0"]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0"]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}
