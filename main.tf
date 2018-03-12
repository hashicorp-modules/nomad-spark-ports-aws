resource "aws_security_group" "nomad_spark" {
  count = "${var.provision == "true" ? 1 : 0}"

  name        = "${var.name}"
  description = "Security Group for ${var.name} Nomad Spark"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

# HDFS NameNode UI
resource "aws_security_group_rule" "hdfs_namenode_ui" {
  count = "${var.provision == "true" ? 1 : 0}"

  security_group_id = "${aws_security_group.nomad_spark.id}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 50070
  to_port           = 50070
  cidr_blocks       = ["${var.cidr_blocks}"]
}

# HDFS DataNode UI
resource "aws_security_group_rule" "hdfs_datanode_ui" {
  count = "${var.provision == "true" ? 1 : 0}"

  security_group_id = "${aws_security_group.nomad_spark.id}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 50075
  to_port           = 50075
  cidr_blocks       = ["${var.cidr_blocks}"]
}

# Spark history server UI
resource "aws_security_group_rule" "history_server_ui" {
  count = "${var.provision == "true" ? 1 : 0}"

  security_group_id = "${aws_security_group.nomad_spark.id}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 18080
  to_port           = 18080
  cidr_blocks       = ["${var.cidr_blocks}"]
}

# Inter communication between HDFS
resource "aws_security_group_rule" "outbound_tcp" {
  count = "${var.provision == "true" ? 1 : 0}"

  security_group_id = "${aws_security_group.nomad_spark.id}"
  type              = "ingress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
}
