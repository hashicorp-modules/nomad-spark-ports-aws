# AWS Nomad Spark Ports Terraform Module

Creates a standard Nomad Spark security group in AWS.

Checkout [examples](./examples) for fully functioning examples.

## Environment Variables

- `AWS_DEFAULT_REGION`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

## Input Variables

- `create`: [Optional] Create Module, defaults to true.
- `name`: [Optional] Name for resources, defaults to "nomad-spark-ports-aws".
- `vpc_id`: [Required] VPC ID to provision resources in.
- `cidr_blocks`: [Required] CIDR blocks for Security Groups.
- `tags`: [Optional] Optional map of tags to set on resources, defaults to empty map.

## Outputs

- `nomad_spark_sg_id`: Nomad spark security group ID.

## Module Dependencies

_None_

## Authors

HashiCorp Solutions Engineering Team.

## License

Mozilla Public License Version 2.0. See LICENSE for full details.
