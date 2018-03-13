resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "${var.name}"
  }
}

module "nomad_spark_ports_aws" {
  # source = "github.com/hashicorp-modules/nomad-spark-ports-aws?ref=f-refactor"
  source = "../../../nomad-spark-ports-aws"

  vpc_id      = "${aws_vpc.main.id}"
  cidr_blocks = ["${aws_vpc.main.cidr_block}"]
}
