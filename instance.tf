resource "aws_instance" "db2-server-1" {
  ami           = data.aws_ami.rhel_8_7.id
  instance_type = "t3.medium"
  # VPC
  subnet_id = module.vpc.public_subnets[0]
  # Security Group
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  # the Public SSH key
  key_name = "${aws_key_pair.us-west2-key-pair.id}"
  connection {
      user = "${var.EC2_USER}"
      private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
  }

  tags = {
    Name = "db2-server-1"
  }
}

resource "aws_instance" "db2-server-2" {
  ami           = data.aws_ami.rhel_8_7.id
  instance_type = "t3.medium"
  # VPC
  subnet_id = module.vpc.public_subnets[0]
  # Security Group
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  # the Public SSH key
  key_name = "${aws_key_pair.us-west2-key-pair.id}"
  connection {
      user = "${var.EC2_USER}"
      private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
  }

  tags = {
    Name = "db2-server-1"
  }
}

resource "aws_instance" "app-server" {
  ami           = data.aws_ami.rhel_8_7.id
  instance_type = "t3.small"
  # VPC
  subnet_id = module.vpc.public_subnets[0]
  # Security Group
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  # the Public SSH key
  key_name = "${aws_key_pair.us-west2-key-pair.id}"
  connection {
      user = "${var.EC2_USER}"
      private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
  }

  tags = {
    Name = "app-server"
  }
}

// Sends your public key to the instance
resource "aws_key_pair" "us-west2-key-pair" {
    key_name = "us-west2-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
