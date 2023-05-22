# terraform-aws-s3-website

Terraform Module for Creating S3 backed Websites

## Usage

```
module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  # namespace = "<NAMESPACE>"
  # name      = "<NAME>"
  #stage     = terraform.workspace
}

module "website" {
  source 	= "git@github.com:ql4b/terraform-aws-s3-website"
	# version = "x.x.x"
	hostname  = "www.ql4b.net"
  context = module.label.context
}

```

 ## Inputs

| **Name**             | **Description**                                                                                      | **Type** | **Default**  | **Required** |
|----------------------|------------------------------------------------------------------------------------------------------|----------|--------------|--------------|
| hostname             | Name of website bucket in fqdn format (e.g. test.example.com). IMPORTANT! Do not add trailing dot (.)| string   |              | yes          |
| index_document       | Website endpoint                                                                                     | string   | index.html   | no           |
| error_document       | Website endpoint                                                                                     | string   | error.html   | no           |


## Outputs

| **Name**             | **Description**                                   |
|----------------------|---------------------------------------------------|
| s3_bucket            | The s3 bucket name/id                             |
| website_endpoint     | Website endpoint                                  |
