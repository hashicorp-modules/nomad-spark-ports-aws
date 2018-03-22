terraform {
  required_version = ">= 0.9.3"
}

resource "aws_security_group" "nomad_spark" {
  count = "${var.create ? 1 : 0}"

  name_prefix = "${var.name}-"
  description = "Security Group for ${var.name} Nomad Spark"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

# HDFS NameNode UI
resource "aws_security_group_rule" "hdfs_namenode_ui" {
  count = "${var.create ? 1 : 0}"

  security_group_id = "${element(aws_security_group.nomad_spark.*.id, 0)}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 50070
  to_port           = 50070
  cidr_blocks       = ["${var.cidr_blocks}"]
}

# HDFS DataNode UI
resource "aws_security_group_rule" "hdfs_datanode_ui" {
  count = "${var.create ? 1 : 0}"

  security_group_id = "${element(aws_security_group.nomad_spark.*.id, 0)}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 50075
  to_port           = 50075
  cidr_blocks       = ["${var.cidr_blocks}"]
}

# Spark history server UI
resource "aws_security_group_rule" "history_server_ui" {
  count = "${var.create ? 1 : 0}"

  security_group_id = "${element(aws_security_group.nomad_spark.*.id, 0)}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 18080
  to_port           = 18080
  cidr_blocks       = ["${var.cidr_blocks}"]
}

# Inter communication between HDFS
resource "aws_security_group_rule" "outbound_tcp" {
  count = "${var.create ? 1 : 0}"

  security_group_id = "${element(aws_security_group.nomad_spark.*.id, 0)}"
  type              = "ingress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}
