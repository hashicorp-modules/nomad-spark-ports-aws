output "nomad_spark_sg_id" {
  value = "${aws_security_group.nomad_spark.id}"
}
