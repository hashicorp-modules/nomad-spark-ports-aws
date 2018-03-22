output "nomad_spark_sg_id" {
  value = "${element(concat(aws_security_group.nomad_spark.*.id, list("")), 0)}" # TODO: Workaround for issue #11210
}
